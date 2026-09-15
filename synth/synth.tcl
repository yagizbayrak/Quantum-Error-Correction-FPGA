# Synthesises, places and routes one core out of context on the Artix-7 part, then writes its utilisation and timing reports.
set top [lindex $argv 0]
set period 4.000
cd [file normalize [file join [file dirname [info script]] ..]]

set sources [dict create \
    syndrome_frontend [list rtl/frontend/syndrome_frontend.sv] \
    union_find_decoder [list rtl/union_find/union_find_decoder.sv] \
    dwn_decoder [concat [glob rtl/dwn/*.sv] [glob rtl/dwn/generated/*.sv]] \
    recurrent_decoder [concat [list rtl/recurrent/recurrent_decoder.sv] [glob -nocomplain rtl/recurrent/generated/*.v]] \
]

read_verilog -sv [dict get $sources $top]
synth_design -top $top -part xc7a100tcsg324-1 -mode out_of_context -include_dirs {rtl/frontend rtl/union_find rtl/dwn/generated}
create_clock -period $period -name clk [get_ports clk]
opt_design
place_design
route_design

file mkdir synth/reports
report_utilization -file synth/reports/${top}_utilization.rpt
report_timing_summary -max_paths 10 -file synth/reports/${top}_timing.rpt
set slack [get_property SLACK [get_timing_paths -max_paths 1]]
puts "RESULT $top period $period slack $slack fmax [format %.1f [expr {1000.0 / ($period - $slack)}]]"

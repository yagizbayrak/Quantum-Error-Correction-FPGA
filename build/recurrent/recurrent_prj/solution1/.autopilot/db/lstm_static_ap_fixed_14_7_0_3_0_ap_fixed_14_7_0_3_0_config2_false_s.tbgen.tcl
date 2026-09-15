set moduleName lstm_static_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_false_s
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 10
set C_modelName {lstm_static<ap_fixed<14, 7, 0, 3, 0>, ap_fixed<14, 7, 0, 3, 0>, config2, false>}
set C_modelType { int 448 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict data { MEM_WIDTH 14 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ reset_state uint 1 regular  }
	{ data int 14 regular {array 8 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "reset_state", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "data", "interface" : "memory", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 448} ]}
# RTL Port declarations: 
set portNum 42
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ reset_state sc_in sc_lv 1 signal 0 } 
	{ data_address0 sc_out sc_lv 3 signal 1 } 
	{ data_ce0 sc_out sc_logic 1 signal 1 } 
	{ data_q0 sc_in sc_lv 14 signal 1 } 
	{ ap_return_0 sc_out sc_lv 14 signal -1 } 
	{ ap_return_1 sc_out sc_lv 14 signal -1 } 
	{ ap_return_2 sc_out sc_lv 14 signal -1 } 
	{ ap_return_3 sc_out sc_lv 14 signal -1 } 
	{ ap_return_4 sc_out sc_lv 14 signal -1 } 
	{ ap_return_5 sc_out sc_lv 14 signal -1 } 
	{ ap_return_6 sc_out sc_lv 14 signal -1 } 
	{ ap_return_7 sc_out sc_lv 14 signal -1 } 
	{ ap_return_8 sc_out sc_lv 14 signal -1 } 
	{ ap_return_9 sc_out sc_lv 14 signal -1 } 
	{ ap_return_10 sc_out sc_lv 14 signal -1 } 
	{ ap_return_11 sc_out sc_lv 14 signal -1 } 
	{ ap_return_12 sc_out sc_lv 14 signal -1 } 
	{ ap_return_13 sc_out sc_lv 14 signal -1 } 
	{ ap_return_14 sc_out sc_lv 14 signal -1 } 
	{ ap_return_15 sc_out sc_lv 14 signal -1 } 
	{ ap_return_16 sc_out sc_lv 14 signal -1 } 
	{ ap_return_17 sc_out sc_lv 14 signal -1 } 
	{ ap_return_18 sc_out sc_lv 14 signal -1 } 
	{ ap_return_19 sc_out sc_lv 14 signal -1 } 
	{ ap_return_20 sc_out sc_lv 14 signal -1 } 
	{ ap_return_21 sc_out sc_lv 14 signal -1 } 
	{ ap_return_22 sc_out sc_lv 14 signal -1 } 
	{ ap_return_23 sc_out sc_lv 14 signal -1 } 
	{ ap_return_24 sc_out sc_lv 14 signal -1 } 
	{ ap_return_25 sc_out sc_lv 14 signal -1 } 
	{ ap_return_26 sc_out sc_lv 14 signal -1 } 
	{ ap_return_27 sc_out sc_lv 14 signal -1 } 
	{ ap_return_28 sc_out sc_lv 14 signal -1 } 
	{ ap_return_29 sc_out sc_lv 14 signal -1 } 
	{ ap_return_30 sc_out sc_lv 14 signal -1 } 
	{ ap_return_31 sc_out sc_lv 14 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "reset_state", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "reset_state", "role": "default" }} , 
 	{ "name": "data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data", "role": "address0" }} , 
 	{ "name": "data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "ce0" }} , 
 	{ "name": "data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "data", "role": "q0" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_return_4", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_4", "role": "default" }} , 
 	{ "name": "ap_return_5", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_5", "role": "default" }} , 
 	{ "name": "ap_return_6", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_6", "role": "default" }} , 
 	{ "name": "ap_return_7", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_7", "role": "default" }} , 
 	{ "name": "ap_return_8", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_8", "role": "default" }} , 
 	{ "name": "ap_return_9", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_9", "role": "default" }} , 
 	{ "name": "ap_return_10", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_10", "role": "default" }} , 
 	{ "name": "ap_return_11", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_11", "role": "default" }} , 
 	{ "name": "ap_return_12", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_12", "role": "default" }} , 
 	{ "name": "ap_return_13", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_13", "role": "default" }} , 
 	{ "name": "ap_return_14", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_14", "role": "default" }} , 
 	{ "name": "ap_return_15", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_15", "role": "default" }} , 
 	{ "name": "ap_return_16", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_16", "role": "default" }} , 
 	{ "name": "ap_return_17", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_17", "role": "default" }} , 
 	{ "name": "ap_return_18", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_18", "role": "default" }} , 
 	{ "name": "ap_return_19", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_19", "role": "default" }} , 
 	{ "name": "ap_return_20", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_20", "role": "default" }} , 
 	{ "name": "ap_return_21", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_21", "role": "default" }} , 
 	{ "name": "ap_return_22", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_22", "role": "default" }} , 
 	{ "name": "ap_return_23", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_23", "role": "default" }} , 
 	{ "name": "ap_return_24", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_24", "role": "default" }} , 
 	{ "name": "ap_return_25", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_25", "role": "default" }} , 
 	{ "name": "ap_return_26", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_26", "role": "default" }} , 
 	{ "name": "ap_return_27", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_27", "role": "default" }} , 
 	{ "name": "ap_return_28", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_28", "role": "default" }} , 
 	{ "name": "ap_return_29", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_29", "role": "default" }} , 
 	{ "name": "ap_return_30", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_30", "role": "default" }} , 
 	{ "name": "ap_return_31", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ap_return_31", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	lstm_static_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_false_s {
		reset_state {Type I LastRead 0 FirstWrite -1}
		data {Type I LastRead 2 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_9 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_8 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_7 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_6 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_5 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_4 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_3 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_2 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_1 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_21 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_20 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_19 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_18 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_17 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_16 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_15 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_14 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_13 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_12 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_11 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_10 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_9 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_8 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_7 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_6 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_5 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_4 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_3 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_2 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_1 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_19 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_18 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_17 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_16 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_15 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_14 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_13 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_12 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_11 {Type IO LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_10 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_43 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_42 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_41 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_40 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_39 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_38 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_37 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_36 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_35 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_34 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_33 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_32 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_31 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_30 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_29 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_28 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_27 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_26 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_25 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_24 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_23 {Type IO LastRead -1 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_22 {Type IO LastRead -1 FirstWrite -1}
		outidx {Type I LastRead -1 FirstWrite -1}
		w2 {Type I LastRead -1 FirstWrite -1}
		outidx_4 {Type I LastRead -1 FirstWrite -1}
		wr2 {Type I LastRead -1 FirstWrite -1}
		sigmoid_table {Type I LastRead -1 FirstWrite -1}
		tanh_table {Type I LastRead -1 FirstWrite -1}}
	dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_1_s {
		data {Type I LastRead 2 FirstWrite -1}
		outidx {Type I LastRead -1 FirstWrite -1}
		w2 {Type I LastRead -1 FirstWrite -1}}
	dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_2_s {
		outidx_4 {Type I LastRead -1 FirstWrite -1}
		wr2 {Type I LastRead -1 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_19 {Type I LastRead 2 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_18 {Type I LastRead 2 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_17 {Type I LastRead 2 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_16 {Type I LastRead 2 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_15 {Type I LastRead 2 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_14 {Type I LastRead 2 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_13 {Type I LastRead 2 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_12 {Type I LastRead 2 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_11 {Type I LastRead 2 FirstWrite -1}
		void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_10 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_43 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_42 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_41 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_40 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_39 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_38 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_37 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_36 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_35 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_34 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_33 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_32 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_31 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_30 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_29 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_28 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_27 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_26 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_25 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_24 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_23 {Type I LastRead 2 FirstWrite -1}
		p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_22 {Type I LastRead 2 FirstWrite -1}}
	sigmoid_ap_fixed_ap_fixed_14_7_0_3_0_sigmoid_config2_recr_s {
		data_0_val {Type I LastRead 0 FirstWrite -1}
		data_1_val {Type I LastRead 0 FirstWrite -1}
		data_2_val {Type I LastRead 0 FirstWrite -1}
		data_3_val {Type I LastRead 0 FirstWrite -1}
		data_4_val {Type I LastRead 0 FirstWrite -1}
		data_5_val {Type I LastRead 0 FirstWrite -1}
		data_6_val {Type I LastRead 0 FirstWrite -1}
		data_7_val {Type I LastRead 0 FirstWrite -1}
		data_8_val {Type I LastRead 0 FirstWrite -1}
		data_9_val {Type I LastRead 0 FirstWrite -1}
		data_10_val {Type I LastRead 0 FirstWrite -1}
		data_11_val {Type I LastRead 0 FirstWrite -1}
		data_12_val {Type I LastRead 0 FirstWrite -1}
		data_13_val {Type I LastRead 0 FirstWrite -1}
		data_14_val {Type I LastRead 0 FirstWrite -1}
		data_15_val {Type I LastRead 0 FirstWrite -1}
		data_16_val {Type I LastRead 0 FirstWrite -1}
		data_17_val {Type I LastRead 0 FirstWrite -1}
		data_18_val {Type I LastRead 0 FirstWrite -1}
		data_19_val {Type I LastRead 0 FirstWrite -1}
		data_20_val {Type I LastRead 0 FirstWrite -1}
		data_21_val {Type I LastRead 0 FirstWrite -1}
		data_22_val {Type I LastRead 0 FirstWrite -1}
		data_23_val {Type I LastRead 0 FirstWrite -1}
		data_24_val {Type I LastRead 0 FirstWrite -1}
		data_25_val {Type I LastRead 0 FirstWrite -1}
		data_26_val {Type I LastRead 0 FirstWrite -1}
		data_27_val {Type I LastRead 0 FirstWrite -1}
		data_28_val {Type I LastRead 0 FirstWrite -1}
		data_29_val {Type I LastRead 0 FirstWrite -1}
		data_30_val {Type I LastRead 0 FirstWrite -1}
		data_31_val {Type I LastRead 0 FirstWrite -1}
		data_32_val {Type I LastRead 0 FirstWrite -1}
		data_33_val {Type I LastRead 0 FirstWrite -1}
		data_34_val {Type I LastRead 0 FirstWrite -1}
		data_35_val {Type I LastRead 0 FirstWrite -1}
		data_36_val {Type I LastRead 0 FirstWrite -1}
		data_37_val {Type I LastRead 0 FirstWrite -1}
		data_38_val {Type I LastRead 0 FirstWrite -1}
		data_39_val {Type I LastRead 0 FirstWrite -1}
		data_40_val {Type I LastRead 0 FirstWrite -1}
		data_41_val {Type I LastRead 0 FirstWrite -1}
		data_42_val {Type I LastRead 0 FirstWrite -1}
		data_43_val {Type I LastRead 0 FirstWrite -1}
		data_44_val {Type I LastRead 0 FirstWrite -1}
		data_45_val {Type I LastRead 0 FirstWrite -1}
		data_46_val {Type I LastRead 0 FirstWrite -1}
		data_47_val {Type I LastRead 0 FirstWrite -1}
		data_48_val {Type I LastRead 0 FirstWrite -1}
		data_49_val {Type I LastRead 0 FirstWrite -1}
		data_50_val {Type I LastRead 0 FirstWrite -1}
		data_51_val {Type I LastRead 0 FirstWrite -1}
		data_52_val {Type I LastRead 0 FirstWrite -1}
		data_53_val {Type I LastRead 0 FirstWrite -1}
		data_54_val {Type I LastRead 0 FirstWrite -1}
		data_55_val {Type I LastRead 0 FirstWrite -1}
		data_56_val {Type I LastRead 0 FirstWrite -1}
		data_57_val {Type I LastRead 0 FirstWrite -1}
		data_58_val {Type I LastRead 0 FirstWrite -1}
		data_59_val {Type I LastRead 0 FirstWrite -1}
		data_60_val {Type I LastRead 0 FirstWrite -1}
		data_61_val {Type I LastRead 0 FirstWrite -1}
		data_62_val {Type I LastRead 0 FirstWrite -1}
		data_63_val {Type I LastRead 0 FirstWrite -1}
		data_64_val {Type I LastRead 0 FirstWrite -1}
		data_65_val {Type I LastRead 0 FirstWrite -1}
		data_66_val {Type I LastRead 0 FirstWrite -1}
		data_67_val {Type I LastRead 0 FirstWrite -1}
		data_68_val {Type I LastRead 0 FirstWrite -1}
		data_69_val {Type I LastRead 0 FirstWrite -1}
		data_70_val {Type I LastRead 0 FirstWrite -1}
		data_71_val {Type I LastRead 0 FirstWrite -1}
		data_72_val {Type I LastRead 0 FirstWrite -1}
		data_73_val {Type I LastRead 0 FirstWrite -1}
		data_74_val {Type I LastRead 0 FirstWrite -1}
		data_75_val {Type I LastRead 0 FirstWrite -1}
		data_76_val {Type I LastRead 0 FirstWrite -1}
		data_77_val {Type I LastRead 0 FirstWrite -1}
		data_78_val {Type I LastRead 0 FirstWrite -1}
		data_79_val {Type I LastRead 0 FirstWrite -1}
		data_80_val {Type I LastRead 0 FirstWrite -1}
		data_81_val {Type I LastRead 0 FirstWrite -1}
		data_82_val {Type I LastRead 0 FirstWrite -1}
		data_83_val {Type I LastRead 0 FirstWrite -1}
		data_84_val {Type I LastRead 0 FirstWrite -1}
		data_85_val {Type I LastRead 0 FirstWrite -1}
		data_86_val {Type I LastRead 0 FirstWrite -1}
		data_87_val {Type I LastRead 0 FirstWrite -1}
		data_88_val {Type I LastRead 0 FirstWrite -1}
		data_89_val {Type I LastRead 0 FirstWrite -1}
		data_90_val {Type I LastRead 0 FirstWrite -1}
		data_91_val {Type I LastRead 0 FirstWrite -1}
		data_92_val {Type I LastRead 0 FirstWrite -1}
		data_93_val {Type I LastRead 0 FirstWrite -1}
		data_94_val {Type I LastRead 0 FirstWrite -1}
		data_95_val {Type I LastRead 0 FirstWrite -1}
		sigmoid_table {Type I LastRead -1 FirstWrite -1}}
	tanh_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_tanh_config2_s {
		data_0_val {Type I LastRead 0 FirstWrite -1}
		data_1_val {Type I LastRead 0 FirstWrite -1}
		data_2_val {Type I LastRead 0 FirstWrite -1}
		data_3_val {Type I LastRead 0 FirstWrite -1}
		data_4_val {Type I LastRead 0 FirstWrite -1}
		data_5_val {Type I LastRead 0 FirstWrite -1}
		data_6_val {Type I LastRead 0 FirstWrite -1}
		data_7_val {Type I LastRead 0 FirstWrite -1}
		data_8_val {Type I LastRead 0 FirstWrite -1}
		data_9_val {Type I LastRead 0 FirstWrite -1}
		data_10_val {Type I LastRead 0 FirstWrite -1}
		data_11_val {Type I LastRead 0 FirstWrite -1}
		data_12_val {Type I LastRead 0 FirstWrite -1}
		data_13_val {Type I LastRead 0 FirstWrite -1}
		data_14_val {Type I LastRead 0 FirstWrite -1}
		data_15_val {Type I LastRead 0 FirstWrite -1}
		data_16_val {Type I LastRead 0 FirstWrite -1}
		data_17_val {Type I LastRead 0 FirstWrite -1}
		data_18_val {Type I LastRead 0 FirstWrite -1}
		data_19_val {Type I LastRead 0 FirstWrite -1}
		data_20_val {Type I LastRead 0 FirstWrite -1}
		data_21_val {Type I LastRead 0 FirstWrite -1}
		data_22_val {Type I LastRead 0 FirstWrite -1}
		data_23_val {Type I LastRead 0 FirstWrite -1}
		data_24_val {Type I LastRead 0 FirstWrite -1}
		data_25_val {Type I LastRead 0 FirstWrite -1}
		data_26_val {Type I LastRead 0 FirstWrite -1}
		data_27_val {Type I LastRead 0 FirstWrite -1}
		data_28_val {Type I LastRead 0 FirstWrite -1}
		data_29_val {Type I LastRead 0 FirstWrite -1}
		data_30_val {Type I LastRead 0 FirstWrite -1}
		data_31_val {Type I LastRead 0 FirstWrite -1}
		tanh_table {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "100", "Max" : "101"}
	, {"Name" : "Interval", "Min" : "100", "Max" : "101"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	reset_state { ap_none {  { reset_state in_data 0 1 } } }
	data { ap_memory {  { data_address0 mem_address 1 3 }  { data_ce0 mem_ce 1 1 }  { data_q0 mem_dout 0 14 } } }
}

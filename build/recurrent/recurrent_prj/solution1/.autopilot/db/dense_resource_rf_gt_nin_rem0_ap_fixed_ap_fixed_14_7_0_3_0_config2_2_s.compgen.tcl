# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler recurrent_sparsemux_65_5_14_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


set name recurrent_mul_14s_10s_24_4_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 3 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler recurrent_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_2_s_outidxdEe BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler recurrent_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_2_s_wr2_ROeOg BINDTYPE {storage} TYPE {rom_np} IMPL {bram} LATENCY 3 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 108 \
    name void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_19 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_19 \
    op interface \
    ports { void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_19 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 109 \
    name void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_18 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_18 \
    op interface \
    ports { void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_18 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 110 \
    name void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_17 \
    op interface \
    ports { void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_17 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 111 \
    name void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_16 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_16 \
    op interface \
    ports { void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_16 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 112 \
    name void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_15 \
    op interface \
    ports { void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_15 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 113 \
    name void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_14 \
    op interface \
    ports { void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_14 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 114 \
    name void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_13 \
    op interface \
    ports { void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_13 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 115 \
    name void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_12 \
    op interface \
    ports { void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_12 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 116 \
    name void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_11 \
    op interface \
    ports { void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_11 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 117 \
    name void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_10 \
    op interface \
    ports { void_lstm_static_bool_ap_fixed_ap_fixed_ap_fixed_weight_t_recurrent_weight_t_10 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 118 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_43 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_43 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_43 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 119 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_42 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_42 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_42 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_41 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_41 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_41 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 121 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_40 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_40 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_40 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 122 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_39 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_39 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_39 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 123 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_38 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_38 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_38 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 124 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_37 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_37 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_37 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 125 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_36 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_36 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_36 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 126 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_35 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_35 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_35 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 127 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_34 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_34 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_34 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_33 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_33 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_33 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 129 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_32 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_32 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_32 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 130 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_31 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_31 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_31 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 131 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_30 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_30 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_30 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_29 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_29 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_29 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_28 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_28 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_28 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_27 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_27 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_27 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 135 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_26 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_26 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_26 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_25 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_25 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_25 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_24 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_24 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_24 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_23 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_23 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_23 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 139 \
    name p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_22 \
    op interface \
    ports { p_ZZN4nnet11lstm_staticI8ap_fixedILi14ELi7EL9ap_q_mode0EL9ap_o_mode3ELi0EES4_7con_22 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 1 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -4 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}



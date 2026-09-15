set SynModuleInfo {
  {SRCNAME dense_resource_rf_gt_nin_rem0<ap_fixed,ap_fixed<14,7,0,3,0>,config2_1> MODELNAME dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_1_s RTLNAME recurrent_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_1_s
    SUBMODULES {
      {MODELNAME recurrent_mul_14s_13s_27_4_1 RTLNAME recurrent_mul_14s_13s_27_4_1 BINDTYPE op TYPE mul IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME recurrent_mul_14s_11s_25_4_1 RTLNAME recurrent_mul_14s_11s_25_4_1 BINDTYPE op TYPE mul IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME recurrent_sparsemux_17_3_14_1_1 RTLNAME recurrent_sparsemux_17_3_14_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME recurrent_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_1_s_outidxbkb RTLNAME recurrent_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_1_s_outidxbkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME recurrent_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_1_s_w2_ROMcud RTLNAME recurrent_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_1_s_w2_ROMcud BINDTYPE storage TYPE rom_np IMPL bram LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME dense_resource_rf_gt_nin_rem0<ap_fixed,ap_fixed<14,7,0,3,0>,config2_2> MODELNAME dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_2_s RTLNAME recurrent_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_2_s
    SUBMODULES {
      {MODELNAME recurrent_sparsemux_65_5_14_1_1 RTLNAME recurrent_sparsemux_65_5_14_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME recurrent_mul_14s_10s_24_4_1 RTLNAME recurrent_mul_14s_10s_24_4_1 BINDTYPE op TYPE mul IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME recurrent_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_2_s_outidxdEe RTLNAME recurrent_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_2_s_outidxdEe BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME recurrent_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_2_s_wr2_ROeOg RTLNAME recurrent_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_2_s_wr2_ROeOg BINDTYPE storage TYPE rom_np IMPL bram LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME sigmoid<ap_fixed,ap_fixed<14,7,0,3,0>,sigmoid_config2_recr> MODELNAME sigmoid_ap_fixed_ap_fixed_14_7_0_3_0_sigmoid_config2_recr_s RTLNAME recurrent_sigmoid_ap_fixed_ap_fixed_14_7_0_3_0_sigmoid_config2_recr_s
    SUBMODULES {
      {MODELNAME recurrent_sigmoid_ap_fixed_ap_fixed_14_7_0_3_0_sigmoid_config2_recr_s_sigmoid_table_ROMfYi RTLNAME recurrent_sigmoid_ap_fixed_ap_fixed_14_7_0_3_0_sigmoid_config2_recr_s_sigmoid_table_ROMfYi BINDTYPE storage TYPE rom IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME {tanh<ap_fixed<14, 7, 0, 3, 0>, ap_fixed<14, 7, 0, 3, 0>, tanh_config2>} MODELNAME tanh_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_tanh_config2_s RTLNAME recurrent_tanh_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_tanh_config2_s
    SUBMODULES {
      {MODELNAME recurrent_tanh_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_tanh_config2_s_tanh_table_ROM_AUg8j RTLNAME recurrent_tanh_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_tanh_config2_s_tanh_table_ROM_AUg8j BINDTYPE storage TYPE rom IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME {lstm_static<ap_fixed<14, 7, 0, 3, 0>, ap_fixed<14, 7, 0, 3, 0>, config2, false>} MODELNAME lstm_static_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_false_s RTLNAME recurrent_lstm_static_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_false_s
    SUBMODULES {
      {MODELNAME recurrent_mul_14s_14s_28_4_1 RTLNAME recurrent_mul_14s_14s_28_4_1 BINDTYPE op TYPE mul IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME {lstm_stack<ap_fixed<14, 7, 0, 3, 0>, ap_fixed<14, 7, 0, 3, 0>, config2>} MODELNAME lstm_stack_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_s RTLNAME recurrent_lstm_stack_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_s
    SUBMODULES {
      {MODELNAME recurrent_partselect_14ns_448ns_9ns_14_2_1 RTLNAME recurrent_partselect_14ns_448ns_9ns_14_2_1 BINDTYPE op TYPE partselect IMPL auto}
      {MODELNAME recurrent_lstm_stack_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_s_data_in_RAM_AUTOhbi RTLNAME recurrent_lstm_stack_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_s_data_in_RAM_AUTOhbi BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME dense_resource_rf_leq_nin<ap_fixed,ap_fixed<14,7,0,3,0>,config3> MODELNAME dense_resource_rf_leq_nin_ap_fixed_ap_fixed_14_7_0_3_0_config3_s RTLNAME recurrent_dense_resource_rf_leq_nin_ap_fixed_ap_fixed_14_7_0_3_0_config3_s
    SUBMODULES {
      {MODELNAME recurrent_mac_muladd_14s_10s_28s_28_4_1 RTLNAME recurrent_mac_muladd_14s_10s_28s_28_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME recurrent_dense_resource_rf_leq_nin_ap_fixed_ap_fixed_14_7_0_3_0_config3_s_w3_ROM_NP_BRibs RTLNAME recurrent_dense_resource_rf_leq_nin_ap_fixed_ap_fixed_14_7_0_3_0_config3_s_w3_ROM_NP_BRibs BINDTYPE storage TYPE rom_np IMPL bram LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME recurrent MODELNAME recurrent RTLNAME recurrent IS_TOP 1
    SUBMODULES {
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_1_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_2_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_3_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_4_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_5_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_6_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_7_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_8_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_9_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_10_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_11_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_12_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_13_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_14_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_15_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_16_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_17_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_18_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_19_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_20_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_21_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_22_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_23_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_24_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_25_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_26_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_27_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_28_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_29_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_30_U}
      {MODELNAME recurrent_fifo_w14_d2_S RTLNAME recurrent_fifo_w14_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_31_U}
    }
  }
}

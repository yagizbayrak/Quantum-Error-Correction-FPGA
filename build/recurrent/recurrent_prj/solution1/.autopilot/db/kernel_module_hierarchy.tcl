set ModuleHierarchy {[{
"Name" : "recurrent", "RefName" : "recurrent","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "lstm_stack_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_U0", "RefName" : "lstm_stack_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_s","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_242_2","RefName" : "VITIS_LOOP_242_2","ID" : "2","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_lstm_static_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_false_s_fu_445", "RefName" : "lstm_static_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_false_s","ID" : "3","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_1_s_fu_530", "RefName" : "dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_1_s","ID" : "4","Type" : "pipeline",
					"SubLoops" : [
					{"Name" : "ReuseLoop","RefName" : "ReuseLoop","ID" : "5","Type" : "pipeline"},]},
				{"Name" : "grp_dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_2_s_fu_540", "RefName" : "dense_resource_rf_gt_nin_rem0_ap_fixed_ap_fixed_14_7_0_3_0_config2_2_s","ID" : "6","Type" : "pipeline",
					"SubLoops" : [
					{"Name" : "ReuseLoop","RefName" : "ReuseLoop","ID" : "7","Type" : "pipeline"},]},
				{"Name" : "grp_sigmoid_ap_fixed_ap_fixed_14_7_0_3_0_sigmoid_config2_recr_s_fu_612", "RefName" : "sigmoid_ap_fixed_ap_fixed_14_7_0_3_0_sigmoid_config2_recr_s","ID" : "8","Type" : "pipeline"},
				{"Name" : "grp_tanh_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_tanh_config2_s_fu_714", "RefName" : "tanh_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_tanh_config2_s","ID" : "9","Type" : "pipeline"},]},]},]},
	{"Name" : "dense_resource_rf_leq_nin_ap_fixed_ap_fixed_14_7_0_3_0_config3_U0", "RefName" : "dense_resource_rf_leq_nin_ap_fixed_ap_fixed_14_7_0_3_0_config3_s","ID" : "10","Type" : "pipeline",
		"SubLoops" : [
		{"Name" : "ReuseLoop","RefName" : "ReuseLoop","ID" : "11","Type" : "pipeline"},]},]
}]}
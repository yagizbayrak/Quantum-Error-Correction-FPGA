set moduleName recurrent
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 1
set pipeline_type dataflow
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
set C_modelName {recurrent}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ input_layer int 448 regular {pointer 0}  }
	{ layer3_out int 14 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "input_layer", "interface" : "wire", "bitwidth" : 448, "direction" : "READONLY"} , 
 	{ "Name" : "layer3_out", "interface" : "wire", "bitwidth" : 14, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 10
set portList { 
	{ input_layer sc_in sc_lv 448 signal 0 } 
	{ layer3_out sc_out sc_lv 14 signal 1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ input_layer_ap_vld sc_in sc_logic 1 invld 0 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ layer3_out_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
}
set NewPortList {[ 
	{ "name": "input_layer", "direction": "in", "datatype": "sc_lv", "bitwidth":448, "type": "signal", "bundle":{"name": "input_layer", "role": "default" }} , 
 	{ "name": "layer3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "layer3_out", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "input_layer_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "input_layer", "role": "ap_vld" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "layer3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "layer3_out", "role": "ap_vld" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	recurrent {
		input_layer {Type I LastRead 0 FirstWrite -1}
		layer3_out {Type O LastRead -1 FirstWrite 7}
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
		tanh_table {Type I LastRead -1 FirstWrite -1}
		w3 {Type I LastRead -1 FirstWrite -1}}
	lstm_stack_ap_fixed_14_7_0_3_0_ap_fixed_14_7_0_3_0_config2_s {
		input_layer {Type I LastRead 0 FirstWrite -1}
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
		tanh_table {Type I LastRead -1 FirstWrite -1}}
	dense_resource_rf_leq_nin_ap_fixed_ap_fixed_14_7_0_3_0_config3_s {
		p_read {Type I LastRead 1 FirstWrite -1}
		p_read1 {Type I LastRead 1 FirstWrite -1}
		p_read2 {Type I LastRead 1 FirstWrite -1}
		p_read3 {Type I LastRead 1 FirstWrite -1}
		p_read4 {Type I LastRead 1 FirstWrite -1}
		p_read5 {Type I LastRead 1 FirstWrite -1}
		p_read6 {Type I LastRead 1 FirstWrite -1}
		p_read7 {Type I LastRead 1 FirstWrite -1}
		p_read8 {Type I LastRead 1 FirstWrite -1}
		p_read9 {Type I LastRead 1 FirstWrite -1}
		p_read10 {Type I LastRead 1 FirstWrite -1}
		p_read11 {Type I LastRead 1 FirstWrite -1}
		p_read12 {Type I LastRead 1 FirstWrite -1}
		p_read13 {Type I LastRead 1 FirstWrite -1}
		p_read14 {Type I LastRead 1 FirstWrite -1}
		p_read15 {Type I LastRead 1 FirstWrite -1}
		p_read16 {Type I LastRead 1 FirstWrite -1}
		p_read17 {Type I LastRead 1 FirstWrite -1}
		p_read18 {Type I LastRead 1 FirstWrite -1}
		p_read19 {Type I LastRead 1 FirstWrite -1}
		p_read20 {Type I LastRead 1 FirstWrite -1}
		p_read21 {Type I LastRead 1 FirstWrite -1}
		p_read22 {Type I LastRead 1 FirstWrite -1}
		p_read23 {Type I LastRead 1 FirstWrite -1}
		p_read24 {Type I LastRead 1 FirstWrite -1}
		p_read25 {Type I LastRead 1 FirstWrite -1}
		p_read26 {Type I LastRead 1 FirstWrite -1}
		p_read27 {Type I LastRead 1 FirstWrite -1}
		p_read28 {Type I LastRead 1 FirstWrite -1}
		p_read29 {Type I LastRead 1 FirstWrite -1}
		p_read30 {Type I LastRead 1 FirstWrite -1}
		p_read31 {Type I LastRead 1 FirstWrite -1}
		layer3_out {Type O LastRead -1 FirstWrite 7}
		w3 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "475", "Max" : "480"}
	, {"Name" : "Interval", "Min" : "438", "Max" : "442"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_layer { ap_vld {  { input_layer in_data 0 448 }  { input_layer_ap_vld in_vld 0 1 } } }
	layer3_out { ap_vld {  { layer3_out out_data 1 14 }  { layer3_out_ap_vld out_vld 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}

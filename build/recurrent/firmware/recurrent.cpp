#include <iostream>

#include "recurrent.h"
#include "parameters.h"


void recurrent(
    input_t input_layer[4*8],
    result_t layer3_out[1]
) {

    // hls-fpga-machine-learning insert IO
    #pragma HLS ARRAY_RESHAPE variable=input_layer complete dim=0
    #pragma HLS ARRAY_PARTITION variable=layer3_out complete dim=0
    #pragma HLS INTERFACE ap_vld port=input_layer,layer3_out 
    #pragma HLS DATAFLOW

    // hls-fpga-machine-learning insert load weights
#ifndef __SYNTHESIS__
    static bool loaded_weights = false;
    if (!loaded_weights) {
        nnet::load_weights_from_txt<lstm_weight_t, 1024>(w2, "w2.txt");
        nnet::load_weights_from_txt<lstm_recurrent_weight_t, 4096>(wr2, "wr2.txt");
        nnet::load_weights_from_txt<lstm_bias_t, 128>(b2, "b2.txt");
        nnet::load_weights_from_txt<lstm_recurrent_bias_t, 128>(br2, "br2.txt");
        nnet::load_weights_from_txt<dense_weight_t, 32>(w3, "w3.txt");
        nnet::load_weights_from_txt<dense_bias_t, 1>(b3, "b3.txt");
        loaded_weights = true;    }
#endif
    // ****************************************
    // NETWORK INSTANTIATION
    // ****************************************

    // hls-fpga-machine-learning insert layers

    layer2_t layer2_out[32];
    #pragma HLS ARRAY_PARTITION variable=layer2_out complete dim=0

    nnet::lstm_stack<input_t, layer2_t, config2>(input_layer, layer2_out, w2, wr2, b2, br2); // lstm

    nnet::dense<layer2_t, result_t, config3>(layer2_out, layer3_out, w3, b3); // dense

}


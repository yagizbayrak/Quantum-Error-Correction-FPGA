#ifndef DEFINES_H_
#define DEFINES_H_

#include "ap_fixed.h"
#include "ap_int.h"
#include "nnet_utils/nnet_types.h"
#include <array>
#include <cstddef>
#include <cstdio>
#include <tuple>
#include <tuple>


// hls-fpga-machine-learning insert numbers

// hls-fpga-machine-learning insert layer-precision
typedef ap_fixed<14,7,AP_RND,AP_WRAP,0> input_t;
typedef ap_fixed<14,7,AP_RND,AP_WRAP,0> lstm_accum_t;
typedef ap_fixed<14,7,AP_RND,AP_WRAP,0> layer2_t;
typedef ap_fixed<13,6,AP_RND,AP_WRAP,0> lstm_weight_t;
typedef ap_fixed<11,4,AP_RND,AP_WRAP,0> lstm_recurrent_weight_t;
typedef ap_fixed<10,3,AP_RND,AP_WRAP,0> lstm_bias_t;
typedef ap_fixed<10,3,AP_RND,AP_WRAP,0> lstm_recurrent_bias_t;
typedef ap_fixed<18,8> lstm_table_t;
typedef ap_uint<1> layer2_index;
typedef ap_fixed<30,16> dense_accum_t;
typedef ap_fixed<14,7,AP_RND,AP_WRAP,0> result_t;
typedef ap_fixed<10,3,AP_RND,AP_WRAP,0> dense_weight_t;
typedef ap_fixed<9,2,AP_RND,AP_WRAP,0> dense_bias_t;
typedef ap_uint<1> layer3_index;

// hls-fpga-machine-learning insert emulator-defines


#endif

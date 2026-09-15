#ifndef PARAMETERS_H_
#define PARAMETERS_H_

#include "ap_fixed.h"
#include "ap_int.h"

#include "nnet_utils/nnet_code_gen.h"
#include "nnet_utils/nnet_helpers.h"
// hls-fpga-machine-learning insert includes
#include "nnet_utils/nnet_dense.h"
#include "nnet_utils/nnet_dense_compressed.h"
#include "nnet_utils/nnet_dense_stream.h"
#include "nnet_utils/nnet_recurrent.h"

// hls-fpga-machine-learning insert weights
#include "weights/w2.h"
#include "weights/wr2.h"
#include "weights/b2.h"
#include "weights/br2.h"
#include "weights/w3.h"
#include "weights/b3.h"


// hls-fpga-machine-learning insert layer-config
// lstm
struct config2_1 : nnet::dense_config {
    static const unsigned n_in = 8;
    static const unsigned n_out = 128;
    static const unsigned strategy = nnet::resource;
    static const unsigned reuse_factor = 64;
    static const unsigned n_zeros = 200;
    static const unsigned n_nonzeros = 824;
    static const unsigned multiplier_limit = DIV_ROUNDUP(n_in * n_out, reuse_factor) - n_zeros / reuse_factor;
    static const bool store_weights_in_bram = false;
    typedef lstm_accum_t accum_t;
    typedef lstm_bias_t bias_t;
    typedef lstm_weight_t weight_t;
    template<class data_T, class res_T, class CONFIG_T>
    using kernel = nnet::DenseResource_rf_gt_nin_rem0<data_T, res_T, CONFIG_T>;
    template<class x_T, class y_T>
    using product = nnet::product::mult<x_T, y_T>;
};

struct config2_2 : nnet::dense_config {
    static const unsigned n_in = 32;
    static const unsigned n_out = 128;
    static const unsigned strategy = nnet::resource;
    static const unsigned reuse_factor = 64;
    static const unsigned n_zeros = 431;
    static const unsigned n_nonzeros = 3665;
    static const unsigned multiplier_limit = DIV_ROUNDUP(n_in * n_out, reuse_factor) - n_zeros / reuse_factor;
    static const bool store_weights_in_bram = false;
    typedef lstm_accum_t accum_t;
    typedef lstm_recurrent_bias_t bias_t;
    typedef lstm_recurrent_weight_t weight_t;
    template<class data_T, class res_T, class CONFIG_T>
    using kernel = nnet::DenseResource_rf_gt_nin_rem0<data_T, res_T, CONFIG_T>;
    template<class x_T, class y_T>
    using product = nnet::product::mult<x_T, y_T>;
};

struct sigmoid_config2_recr : nnet::activ_config {
    static const unsigned n_in = 96;
    static const unsigned table_size = 1024;
    static const unsigned io_type = nnet::io_parallel;
    static const unsigned reuse_factor = 64;
    typedef lstm_table_t table_t;
};

struct tanh_config2 : nnet::activ_config {
    static const unsigned n_in = 32;
    static const unsigned table_size = 1024;
    static const unsigned io_type = nnet::io_parallel;
    static const unsigned reuse_factor = 64;
    typedef lstm_table_t table_t;
};

struct config2 : nnet::lstm_config {
    typedef lstm_accum_t accum_t;
    typedef lstm_weight_t weight_t;  // Matrix
    typedef lstm_recurrent_weight_t recurrent_weight_t;  // Matrix
    typedef lstm_bias_t bias_t;  // Vector
    typedef lstm_recurrent_bias_t recurrent_bias_t;  // Vector
    typedef config2_1 mult_config1;
    typedef config2_2 mult_config2;
    typedef sigmoid_config2_recr ACT_CONFIG_LSTM;
    template<class x_T, class y_T, class config_T>
    using activation_recr = nnet::activation::sigmoid<x_T, y_T, config_T>;
    typedef tanh_config2 ACT_CONFIG_T;
    template<class x_T, class y_T, class config_T>
    using activation = nnet::activation::tanh<x_T, y_T, config_T>;
    static const unsigned n_in  = 8;
    static const unsigned n_out = 32;
    static const unsigned n_state = 32;
    static const unsigned n_sequence = 4;
    static const unsigned n_sequence_out = 1;
    static const unsigned io_type = nnet::resource;
    static const unsigned reuse_factor = 64;
    static const bool store_weights_in_bram = false;
    static const bool use_static = true;
    static const bool pytorch_order = false;
};

// dense
struct config3 : nnet::dense_config {
    static const unsigned n_in = 32;
    static const unsigned n_out = 1;
    static const unsigned io_type = nnet::io_parallel;
    static const unsigned strategy = nnet::resource;
    static const unsigned reuse_factor = 32;
    static const unsigned n_zeros = 1;
    static const unsigned n_nonzeros = 31;
    static const unsigned multiplier_limit = DIV_ROUNDUP(n_in * n_out, reuse_factor) - n_zeros / reuse_factor;
    static const bool store_weights_in_bram = false;
    typedef dense_accum_t accum_t;
    typedef dense_bias_t bias_t;
    typedef dense_weight_t weight_t;
    typedef layer3_index index_t;
    template<class data_T, class res_T, class CONFIG_T>
    using kernel = nnet::DenseResource_rf_leq_nin<data_T, res_T, CONFIG_T>;
    template<class x_T, class y_T>
    using product = nnet::product::mult<x_T, y_T>;
};



#endif

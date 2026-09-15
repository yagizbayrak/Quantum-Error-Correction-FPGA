#ifndef RECURRENT_BRIDGE_H_
#define RECURRENT_BRIDGE_H_

#include "firmware/recurrent.h"
#include "firmware/nnet_utils/nnet_helpers.h"
#include <algorithm>
#include <map>

// hls-fpga-machine-learning insert bram

namespace nnet {
bool trace_enabled = false;
std::map<std::string, void *> *trace_outputs = NULL;
size_t trace_type_size = sizeof(double);
} // namespace nnet

extern "C" {

struct trace_data {
    const char *name;
    void *data;
};

void allocate_trace_storage(size_t element_size) {
    nnet::trace_enabled = true;
    nnet::trace_outputs = new std::map<std::string, void *>;
    nnet::trace_type_size = element_size;
}

void free_trace_storage() {
    for (std::map<std::string, void *>::iterator i = nnet::trace_outputs->begin(); i != nnet::trace_outputs->end(); i++) {
        void *ptr = i->second;
        free(ptr);
    }
    nnet::trace_outputs->clear();
    delete nnet::trace_outputs;
    nnet::trace_outputs = NULL;
    nnet::trace_enabled = false;
}

void collect_trace_output(struct trace_data *c_trace_outputs) {
    int ii = 0;
    for (std::map<std::string, void *>::iterator i = nnet::trace_outputs->begin(); i != nnet::trace_outputs->end(); i++) {
        c_trace_outputs[ii].name = i->first.c_str();
        c_trace_outputs[ii].data = i->second;
        ii++;
    }
}

// hls-fpga-machine-learning insert tb_input_writer

// Wrapper of top level function for Python bridge
void recurrent_float(
    float *input_layer,
    float *layer3_out
) {

    input_t input_layer_ap[4*8];
    nnet::convert_data<float, input_t, 4*8>(input_layer, input_layer_ap);

    result_t layer3_out_ap[1];

    recurrent(input_layer_ap,layer3_out_ap);

    nnet::convert_data<result_t, float, 1>(layer3_out_ap, layer3_out);
}

void recurrent_double(
    double *input_layer,
    double *layer3_out
) {

    input_t input_layer_ap[4*8];
    nnet::convert_data<double, input_t, 4*8>(input_layer, input_layer_ap);

    result_t layer3_out_ap[1];

    recurrent(input_layer_ap,layer3_out_ap);

    nnet::convert_data<result_t, double, 1>(layer3_out_ap, layer3_out);
}
}

#endif

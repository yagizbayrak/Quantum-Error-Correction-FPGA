#ifndef RECURRENT_H_
#define RECURRENT_H_

#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_stream.h"

#include "defines.h"


// Prototype of top level function for C-synthesis
void recurrent(
    input_t input_layer[4*8],
    result_t layer3_out[1]
);

// hls-fpga-machine-learning insert emulator-defines


#endif

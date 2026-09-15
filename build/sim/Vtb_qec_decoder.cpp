// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vtb_qec_decoder__pch.h"

//============================================================
// Constructors

Vtb_qec_decoder::Vtb_qec_decoder(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vtb_qec_decoder__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vtb_qec_decoder::Vtb_qec_decoder(const char* _vcname__)
    : Vtb_qec_decoder(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vtb_qec_decoder::~Vtb_qec_decoder() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vtb_qec_decoder___024root___eval_debug_assertions(Vtb_qec_decoder___024root* vlSelf);
#endif  // VL_DEBUG
void Vtb_qec_decoder___024root___eval_static(Vtb_qec_decoder___024root* vlSelf);
void Vtb_qec_decoder___024root___eval_initial(Vtb_qec_decoder___024root* vlSelf);
void Vtb_qec_decoder___024root___eval_settle(Vtb_qec_decoder___024root* vlSelf);
void Vtb_qec_decoder___024root___eval(Vtb_qec_decoder___024root* vlSelf);

void Vtb_qec_decoder::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vtb_qec_decoder::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vtb_qec_decoder___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vtb_qec_decoder___024root___eval_static(&(vlSymsp->TOP));
        Vtb_qec_decoder___024root___eval_initial(&(vlSymsp->TOP));
        Vtb_qec_decoder___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vtb_qec_decoder___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vtb_qec_decoder::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty() && !contextp()->gotFinish(); }

uint64_t Vtb_qec_decoder::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vtb_qec_decoder::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vtb_qec_decoder___024root___eval_final(Vtb_qec_decoder___024root* vlSelf);

VL_ATTR_COLD void Vtb_qec_decoder::final() {
    contextp()->executingFinal(true);
    Vtb_qec_decoder___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vtb_qec_decoder::hierName() const { return vlSymsp->name(); }
const char* Vtb_qec_decoder::modelName() const { return "Vtb_qec_decoder"; }
unsigned Vtb_qec_decoder::threads() const { return 1; }
void Vtb_qec_decoder::prepareClone() const { contextp()->prepareClone(); }
void Vtb_qec_decoder::atClone() const {
    contextp()->threadPoolpOnClone();
}

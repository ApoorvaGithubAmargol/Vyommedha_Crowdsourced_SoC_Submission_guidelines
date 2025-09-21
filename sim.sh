#!/bin/bash
iverilog -g2012 -o cordic_sim_output\
	src/rtl/cordic_fsm.v\
	src/rtl/cordic_inputs.v\
	src/rtl/cordic_iter.v\
	src/rtl/cordic_lut.v\
	src/rtl/cordic_outputs.v\
	src/rtl/cordic_peripheral.v\
	src/rtl/cordic_register.v\
	src/rtl/cordic_scaling.v\
	src/tb/cordic_core_TB.v

vvp cordic_sim_output


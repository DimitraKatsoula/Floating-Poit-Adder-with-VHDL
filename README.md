# Floating-Point Adder/Subtractor in VHDL

## Overview

This repository contains the VHDL implementation of a **32-bit floating-point adder/subtractor**, developed as part of my MSc thesis in **Electronic Physics – Electronic Circuit Design** at the Aristotle University of Thessaloniki.

The project explores the design and implementation of floating-point arithmetic hardware using VHDL and compares two different architectures:

- **Carry Look-Ahead (CLA) architecture**
- **Pipelined architecture**

The design was developed, simulated and evaluated using Xilinx FPGA development tools.

## Project Objectives

The main objectives of the project were to:

- Design a 32-bit floating-point addition/subtraction unit in VHDL.
- Implement the arithmetic architecture using modular VHDL components.
- Develop and compare CLA and pipelined implementations.
- Verify the functionality of individual components and the complete design using VHDL testbenches.
- Perform synthesis, implementation and timing analysis.
- Compare FPGA resource utilization and performance between the two architectures.

## Design

The floating-point arithmetic unit is composed of several functional blocks responsible for:

- Exponent comparison
- Exponent subtraction
- Mantissa alignment and shifting
- Mantissa addition/subtraction
- Carry Look-Ahead addition
- Result normalization
- Multiplexing and control
- Pipeline registers

The repository contains separate implementations for the **CLA** and **Pipeline** architectures.

## Verification

Functional verification was performed using dedicated VHDL testbenches for the individual modules and the complete floating-point arithmetic unit.

Simulation was carried out using **Xilinx ISim**.

The project also included:

- Functional simulation
- Synthesis
- Map
- Place & Route
- Timing analysis
- FPGA resource-utilization analysis

## Target Hardware and Tools

- **Language:** VHDL
- **FPGA:** Xilinx Spartan-3E
- **Development environment:** Xilinx ISE
- **Simulation:** Xilinx ISim
- **Target clock:** 50 MHz

## Repository Structure

The repository is organized into separate directories containing:

- CLA implementation
- Pipelined implementation
- CLA testbenches
- Pipeline testbenches

The source code is divided into modular VHDL entities to facilitate testing, verification and comparison of the two architectures.

## MSc Thesis

**Thesis title:**  
*Floating-Point Adder and Subtractor using VHDL*

**MSc:** Electronic Physics – Electronic Circuit Design  
**Department of Physics, Aristotle University of Thessaloniki**

The thesis focused on the complete design flow of the floating-point arithmetic unit, from VHDL implementation and simulation to FPGA synthesis, implementation and performance evaluation.

## Author

**Dimitra Katsoula**

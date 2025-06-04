# Lecture 1: Introduction: Fundamentals, Transistors, Gates


###  Core Components of a Computer
A computer consists of:
  - Computation
  - Communication
  - Storage/Memory


###  What is Computer Architecture?
The science and art of designing, selecting, and
interconnecting hardware components and designing the
hardware/software interface to create a computing system
that meets functional, performance, energy consumption,
cost, and other specific goals.

##  General vs. Special Purpose Systems
### General-Purpose Systems (e.g., CPUs)
These are designed to run a wide variety of programs and workloads.

**Pros:**
- Flexible: can handle many different applications
- Easy to program and debug


**Cons:**
- Less efficient for specific tasks
- Higher energy consumption per task

### Special-Purpose Systems (e.g., ASICs)
These are designed and optimized for specific workloads.

**Pros:**
- High efficiency and performance for targeted tasks
- Lower power consumption for the same task
- Customizable and optimized at the hardware level

**Cons:**
- Harder to program (requires HDL or custom frameworks)
- can’t adapt to tasks outside their design




## Transistors & Logic Gates

Transistors are the basic building blocks of modern digital computers. MOS transistors (Metal-Oxide-Semiconductor) act as tiny electronic switches that control the flow of electrical current, enabling computers to process and store information

There are two primary types of MOS transistors: **n-type** and **p-type**. 
- **N-type transistors** conduct electricity when a high voltage is applied to their gate terminal.
- **P-type transistors**, in contrast, conduct when the gate voltage is low.

By combining n-type and p-type transistors in specific arrangements, we can create **logic gates**, which perform basic operations like **NOT**, **AND**, and **NAND**
- A **NOT gate** (also called an inverter) outputs the opposite of its input. If you input a 0 (0V), it outputs a 1 (3V) and vice versa.
- A **NAND gate** is constructed from multiple transistors in series and parallel. It outputs a 0 only when all inputs are 1 otherwise, it outputs a 1.
---


# Lecture 2: Combinational Logic

##  Logic Circuit Basics
- A **combinational logic circuit** has outputs determined only by current inputs.
It has no memory.
- A **sequential logic circuit** has outputs are determined by previous (historical) and current
values of inputs. It has memory.
##  Boolean Algebra

Boolean algebra is a way to describe and work with logic using 1s and 0s. It uses basic operations like **AND**, **OR**, and **NOT** to represent how logic gates work in a circuit.

We use Boolean algebra to write logic equations and then simplify them to make circuits smaller and faster. There are some basic rules, called **laws**, that help us with this:
- **Commutative**: The order of inputs doesn't matter (A + B = B + A).
- **Associative**: Grouping doesn’t matter (A + (B + C) = (A + B) + C).
- **Distributive**: You can factor or expand expressions (A • (B + C) = A•B + A•C).
- **Identity and Complement**: These define how variables behave with 0, 1, and their opposite values.

A useful trick is the **Duality Principle** which implies if something is true in Boolean algebra, you can switch AND with OR and 0 with 1, and it will still be true.

We also use **DeMorgan’s Laws** to rewrite expressions. For example:
- NOT (A AND B) = (NOT A) OR (NOT B)
- NOT (A OR B) = (NOT A) AND (NOT B)
## Canonical Forms (SOP & POS)

In digital logic, we often use **standard ways** to write logic functions so they’re easy to understand and build into circuits. These are called **canonical forms**.

There are two main types:

#### Sum of Products (SOP)
- In SOP form, we list all the input combinations where the output is **1**.
- Each combination is written as an **AND** (product) of inputs or their complements.
- Then, we combine (OR) all those combinations.


####  Product of Sums (POS)
- In POS form, we list all the input combinations where the output is **0**.
- Each combination is written as an **OR** (sum) of inputs or their complements.
- Then, we combine (AND) all those combinations.
 
 Using Boolean Algebra, we can simplify the SOP or POS
form of any function in a methodical way.

##  Common Combinational Building Blocks

- **Decoder**: A combinational circuit that converts *n* binary inputs into 2ⁿ unique outputs, with only one output active for each input combination.
- **Multiplexer (MUX)**: A combinational circuit that selects one of several input signals and forwards it to a single output line, based on the value of control (select) inputs.
- **Full Adder**: A digital circuit that performs binary addition of two input bits and a carry-in bit, producing a sum and a carry-out.
- **PLA (Programmable Logic Array)**: A configurable combinational logic device that implements multiple Boolean functions using a fixed set of programmable AND and OR gates.

##  Additional Components Introduced

- **Tri-State Buffers**: Let multiple devices share the same wire by making sure only one sends a signal at a time.
- **ALU (Arithmetic Logic Unit)**: A circuit that can do different math and logic operations, but only one at a time.
- **Comparator**: Checks if two binary values are the same and gives a signal if they match.
- **4-bit Adders**: Built by connecting four 1-bit full adders to add two 4-bit numbers. 

---
# Lecture 3: Sequential Logic
### Basic Storage Elements

- **Cross-coupled Inverters**
  - Has two stable states: Q = 1 or Q = 0.
  - Can enter a "metastable" state where outputs oscillate between 0 and 1.
.

- **R-S Latch**
  - Built using cross-coupled NAND gates.
  - Stores data at Q; S (set) and R (reset) are control inputs.
  - Must avoid S=R=0 to prevent invalid or metastable states.

- **Gated D Latch**
  - Modification of the R-S latch using additional NAND gates.
  - Input D is latched to Q only when the Write Enable (WE) is 1.
  - Prevents the R-S latch from entering invalid states.

- **D Flip-Flop**
  - Composed of two D latches in sequence.
  - Captures input D on the rising edge of the clock and holds it constant during the rest of the cycle.
  - Enables edge-triggered state changes, making it ideal for synchronous circuits.

- **Register**
  - Consists of multiple D flip-flops or D latches operating in parallel.
  - Stores multi-bit values, commonly used to hold intermediate or final computation results.
  - A single Write Enable (WE) signal allows simultaneous writes to all bits.

- **Memory**
  - An array of storage elements with addressable locations.
  - Each location can be read from or written to via address lines.
  - Defined by address space (number of locations) and addressability (number of bits per location).
##  Sequential Circuits

###  Key Concepts
- Unlike combinational circuits, **sequential circuits** produce outputs based on **current and past inputs**.
- They include **memory elements** (like flip-flops or latches) to retain information across time.
- **State** captures the "memory" or condition of the system.
- **Clock Signal:** Alternates between 0 and 1. And the state changes occur at specific clock edges.
###  Synchronous vs. Asynchronous

| Type           | Description                                            |
|----------------|--------------------------------------------------------|
| **Synchronous** | Transitions occur at clock edges|
| **Asynchronous** | Transitions occur as inputs changes |
## Finite State Machines
### FSM Components:
1. **States:** Define the current configuration or memory of the system.
2. **Inputs:** External signals that influence transitions.
3. **Outputs:** Depend on current state (Moore) or state + input (Mealy).
4. **Next-State Logic:** Determines how the system transitions from one state to another.
5. **Output Logic:** Computes the output based on the state and/or input.
### Parts of FSM:
### 1. Sequential Circuits

This part of the FSM is responsible for keeping track of the **current state**.

- **State Register(s)**:
  - Stores the **current state** of the system.
  - Updates to the **next state** every time the clock ticks (i.e., on the clock edge).



###  2. Combinational Circuits

This part figures out what the next state should be and what outputs to generate, based on the current state and inputs.

- **Next State Logic**:
  - Looks at the current state and inputs.
  - Decides what the next state should be.

- **Output Logic**:
  - Generates the actual outputs of the FSM.
  - These outputs are usually based on the current state and/or inputs.
###  Example Applications

- Traffic light controller
- Combination locks
- Snail pattern detector FSM (e.g., detects 1101 pattern)
---
# Lecture 4: Hardware Description Languages and Verilog

## What are Hardware Description Languages (HDLs)?

HDLs let us:
- Describe hardware structure and behavior
- Simulate circuits (functionally and with timing)
- Synthesize logic from high-level descriptions

### Popular HDLs:
- **Verilog**: More common in the US.
- **VHDL**: More common in Europe.
## Why Use HDLs?

- Enables **parallelism** in modeling — hardware is inherently parallel.
- Allows us to **manage complexity** with module hierarchy.
- Makes hardware easier to design, simulate, and verify.
## Design Methodologies

### Top-Down Design:
- Start with a top-level module.
- Decompose into submodules until reaching gates.

### Bottom-Up Design:
- Build from basic components (gates) upward to the top module.
## Two Main Styles of HDL Implementation

### 1. Structural (Gate-Level)
- Describes the actual structure of the circuit.
- Focuses on how **components are connected**.
- Uses **instantiations** of gates or modules.
- Closest to a schematic and suitable for low-level, optimized design.
### 2. Behavioral Verilog
- Uses `assign`, `if`, `case`, and `always` blocks.
- Describes what the circuit should do, not *how* it does it.
- Easier to write and read.
- Great for combinational and sequential logic.
## What Happens with HDL Code?

### Synthesis
- Converts your Verilog code into real hardware (gates and wires).
- Creates a **netlist** using standard cells.
- Tools try to optimize the design, but results may not be perfect.
- Writing clean and well-structured HDL helps get better results.

### Simulation
- Lets you test your circuit **before** building it.
- Works for both structural and behavioral code.
- Checks if your design works correctly and meets timing.
- A key step in modern digital design.
## Difference Between Combinational and Sequential Circuits in Verilog

| Feature                     | Combinational Circuit                       | Sequential Circuit                          |
|----------------------------|---------------------------------------------|---------------------------------------------|
| **Memory**                 | No                                          | Yes (stores past input using flip-flops)    |
| **Depends on Clock**       | No                                          | Yes (typically triggered on clock edge)     |
| **Sensitivity List**       | `always @(*)` or `assign`                   | `always @(posedge clk)`                     |
| **Assignment Style**       | Blocking (`=`) or `assign`                  | Non-blocking (`<=`)                         |
| **Output Depends On**      | Only current inputs                         | Current inputs and past states              |
| **Example Use**            | Logic gates, adders, multiplexers           | Flip-flops, registers, FSMs                 |
| **Latches Possible**       | Yes, if all conditions not covered          | No, unless written incorrectly              |
| **Simulates As**           | Instant logic change with input             | Updates at clock edge                       |
---
# Lecture 5: Timing and Verification
##  Timing in Combinational Circuits

- **Delays Exist in Real Hardware**
  - **Propagation delay (tpd)**: Max delay from input to output.
  - **Contamination delay (tcd)**: Min delay from input to output.
- **Glitches**: Brief incorrect output values due to differing path delays.
- **Causes of Delay**: Capacitance, resistance, signal path length, environment (e.g. temperature), and aging.
- **Design Tip**: Critical path (longest delay path) determines the maximum speed.
##  Timing in Sequential Circuits

- **D Flip-Flop Constraints**:
  - **Setup time (tsetup)**: Time before clock edge that D must be stable.
  - **Hold time (thold)**: Time after clock edge D must remain stable.
- **Clock-to-Q Delays**:
  - **tpcq**: Propagation delay from clock to output Q.
  - **tccq**: Contamination delay from clock to output Q.
- **Setup Constraint**:  
  `Tc > tpcq + tpd + tsetup`
- **Hold Constraint**:  
  `tccq + tcd > thold`
  ### Metastability

- Occurs when input changes too close to the clock edge.
- Output becomes unstable and unpredictable.
- Can result in system errors or undefined behavior.
### Clock Skew

 **Clock skew** is the difference in clock arrival time between registers.
  - Affects both setup and hold constraints.
  - **Skew increases tsetup and thold requirements.**
  - Must be minimized using careful clock tree design.
  ##  Circuit Verification

### Functional Verification
- Tests if logic works as intended.
- Done using **testbenches** in Verilog.
#### Types of Testbenches:
#### Simple Testbench

- Inputs are **manually assigned** using `initial` blocks.
- Outputs are **manually observed**, often using waveform viewers or `$display()`.
####  Self-Checking Testbench

- Checks outputs automatically using conditional statements.
- Uses `if (y !== expected)` and `$display()` to report mismatches.
####  Automatic Testbench with Golden Model

- Uses a **golden model** to generate expected output.
- DUT and golden model run in parallel.
- Outputs are compared each cycle.
  

### Timing Verification
- Checks if design meets timing constraints after synthesis.
- Tools report:
  - Critical paths
  - Maximum clock frequency
  - Setup/hold violations

---


## Conclusion:
These lectures gave a clear understanding of how computers work, starting from tiny switches (transistors) to full systems using logic, memory, and timing. We also learned how to design and test these systems using Verilog. 

---
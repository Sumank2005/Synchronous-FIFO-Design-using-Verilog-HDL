# Synchronous FIFO Design using Verilog HDL

## 📌 Project Overview

This project implements a **Synchronous FIFO (First-In First-Out)** using **Verilog HDL**.

A FIFO is a temporary storage structure in digital systems where the **first data written into the memory is the first data read from it**.

In this project, the FIFO operates using a **single clock signal**, making it a synchronous FIFO.

## 🔧 Project Specifications

* **Language:** Verilog HDL
* **FIFO Type:** Synchronous FIFO
* **Data Width:** 8-bit
* **FIFO Depth:** 16
* **Clock:** Single clock
* **Read/Write:** Controlled using enable signals
* **Simulation Tool:** Xilinx Vivado / ModelSim
* **Design Type:** RTL

## 🏗️ FIFO Architecture

The FIFO consists of the following main components:

* FIFO Memory
* Write Pointer
* Read Pointer
* Data Counter
* Write Enable
* Read Enable
* Full Flag
* Empty Flag

### Basic Operation

```text
             +----------------------+
 data_in --->|                      |
             |     FIFO Memory      |----> data_out
 write_en -->|                      |
 read_en  -->|                      |
             +----------+-----------+
                        |
                 +------+------+
                 |             |
            Write Pointer  Read Pointer
                 |
              Counter
                 |
          +------+------+
          |             |
      full_flag    empty_flag
```

## ⚙️ Working Principle

### Write Operation

When `write_en` is HIGH and the FIFO is not full:

```text
data_in → FIFO Memory
```

The data is stored at the location pointed to by the **write pointer**.

After writing, the write pointer is incremented.

### Read Operation

When `read_en` is HIGH and the FIFO is not empty:

```text
FIFO Memory → data_out
```

The data is read from the location pointed to by the **read pointer**.

After reading, the read pointer is incremented.

### Full Condition

The FIFO is considered full when the number of stored data elements reaches the FIFO depth.

```verilog
assign full_flag = (count == depth);
```

### Empty Condition

The FIFO is considered empty when there are no stored data elements.

```verilog
assign empty_flag = (count == 0);
```

## 📂 Files in This Repository

```text
Synchronous-FIFO/
│
├── main.v
├── main_tb.v
└── README.md
```

### `main.v`

Contains the main RTL design of the synchronous FIFO.

### `main_tb.v`

Contains the Verilog testbench used to simulate and verify the FIFO design.

### `README.md`

Project documentation and description.

## 🧪 Testbench

The testbench verifies the following operations:

1. FIFO reset
2. Writing data into FIFO
3. Reading data from FIFO
4. Writing multiple data values
5. Reading multiple data values
6. FIFO empty condition
7. FIFO filling operation
8. FIFO full condition

Example data sequence:

```text
Write:
10 → 20 → 30 → 40 → 50

Read:
10 → 20 → 30 → 40 → 50
```

This verifies the **First-In First-Out** behavior.

## 📊 Expected Result

The data should be read in the same order in which it was written.

For example:

| Operation | Data    |
| --------- | ------- |
| Write     | `8'h10` |
| Write     | `8'h20` |
| Write     | `8'h30` |
| Write     | `8'h40` |
| Read      | `8'h10` |
| Read      | `8'h20` |
| Read      | `8'h30` |
| Read      | `8'h40` |

The `full_flag` should become HIGH when the FIFO reaches its maximum capacity, and `empty_flag` should become HIGH when all stored data has been read.

## 🖥️ Simulation

This project can be simulated using:

* Xilinx Vivado
* ModelSim
* QuestaSim
* Other Verilog HDL simulators

### Vivado Steps

1. Create a new RTL project in Vivado.
2. Add `main.v` as a design source.
3. Add `main_tb.v` as a simulation source.
4. Select `main_tb` as the simulation top module.
5. Run **Behavioral Simulation**.
6. Observe:

   * `clk`
   * `rst`
   * `write_en`
   * `read_en`
   * `data_in`
   * `data_out`
   * `full_flag`
   * `empty_flag`

## 🎯 Applications

Synchronous FIFOs are commonly used in:

* Processor design
* FPGA-based systems
* Data buffering
* Digital communication systems
* RTL design
* Memory interfaces
* Pipeline systems
* SoC and embedded systems

## 📚 Concepts Used

This project demonstrates practical implementation of:

* Verilog HDL
* RTL Design
* Sequential Logic
* Registers
* Memory Arrays
* Read/Write Pointers
* Counters
* FIFO Architecture
* Clocked `always` blocks
* Testbench Development
* Functional Simulation

## 🚀 Future Improvements

The design can be further improved by adding:

* Parameterized data width
* Parameterized FIFO depth
* Overflow protection
* Underflow protection
* Almost-full flag
* Almost-empty flag
* FIFO status counter
* Improved testbench with automatic checking

## 👨‍💻 Author

**Suman Kumar**

B.Tech —Electronics and Computer Engineering

## ⭐ Acknowledgement

This project was developed as a learning project to understand **FIFO architecture, Verilog HDL, RTL design, and digital system simulation**.

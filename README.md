# 5-Bit Carry Lookahead Adder (CLA) Design & Layout

This project involves the full-custom design and physical layout of a **5-bit Carry Lookahead Adder (CLA)**. The design focuses on optimizing arithmetic speed by calculating carry bits in parallel, significantly reducing the propagation delay compared to a standard Ripple Carry Adder (RCA).

## 🚀 Project Overview
The Carry Lookahead Adder is a critical component in high-performance digital signal processors and ALUs. This implementation covers the entire VLSI design flow, from logic gate characterization to physical layout extraction and SPICE simulation.

### Key Features
* **High-Speed Architecture:** Implements Carry Generate ($G$) and Carry Propagate ($P$) logic to determine carries in $O(\log N)$ time.
* **Full-Custom Layout:** Designed at the transistor level using the **Magic VLSI** layout tool.
* **Performance Verification:** Validated timing and power consumption through **NGSPICE** transient analysis.
* **Physical Verification:** Performed Design Rule Checks (DRC) and Layout vs. Schematic (LVS) verification to ensure manufacturing readiness.
* **Modular Design:** Utilizes hierarchical cells for Partial Carry Lookahead generators and 1-bit Full Adder slices.



---

## 🛠️ Technical Specifications & Logic
The CLA avoids the "ripple" effect by using the following Boolean logic for each bit $i$:

* **Generate ($G_i$):** $G_i = A_i \cdot B_i$
* **Propagate ($P_i$):** $P_i = A_i \oplus B_i$
* **Carry Out ($C_{i+1}$):** $C_{i+1} = G_i + P_i C_i$

For a 5-bit implementation, the carry logic is expanded as follows:
$$C_5 = G_4 + P_4 G_3 + P_4 P_3 G_2 + P_4 P_3 P_2 G_1 + P_4 P_3 P_2 P_1 G_0 + P_4 P_3 P_2 P_1 P_0 C_{in}$$

### Design Flow
1.  **Logic Design:** Creation of the CLA gate-level schematic.
2.  **Cell Layout:** Individual layout of AND, OR, and XOR gates in CMOS.
3.  **Integration:** Routing and placement of the 5-bit architecture in Magic VLSI.
4.  **Extraction:** Generating `.ext` and `.spice` files for simulation.
5.  **Simulation:** Using NGSPICE to measure rise/fall times and propagation delay.



---

## Tools & Technologies
* **Magic VLSI:** Used for physical layout design, DRC, and netlist extraction.
* **NGSPICE:** Used for transient and DC analysis of the extracted SPICE netlist.
* **IRSIM:** Used for switch-level functional verification.
* **Technology Node:** SCMOS (Scalable CMOS) process.

## Results & Performance Analysis
* **Area Optimization:** Minimized silicon area through strategic transistor sizing and metal layer routing.
* **Delay Analysis:** Measured the critical path delay from inputs to the final sum and carry bits.
* **Functionality:** Successfully verified the addition of 5-bit binary numbers with carry-in and carry-out functionality.

## Repository Contents
* `/Layout`: `.mag` files for the Magic VLSI tool.
* `/Spice`: Extracted `.spice` netlists and simulation scripts.
* `/Docs`: Detailed project report including timing diagrams and DRC results.

---
*Developed as part of the VLSI System Design Course Project.*

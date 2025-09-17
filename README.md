
# Nexys A7-100T FPGA Projects

Welcome to **Nexys A7-100T FPGA Projects**, a curated collection of experiments, designs, and implementations for the Digilent **Nexys A7-100T** development board.  
This repository is dedicated to showcasing practical FPGA projects, tutorials, and resources — all created, tested, and documented for learning and exploration.

---

## 🚀 About This Repository

This repo is structured to help beginners and intermediate FPGA developers quickly get started with the Nexys A7-100T board.  
Here you will find:

- **Working Projects**: Example designs ranging from blinking LEDs to advanced cores.  
- **Guides**: Step-by-step instructions on building, synthesizing, and deploying FPGA designs using Xilinx Vivado.  
- **Utilities**: Helpful scripts, configuration files, and templates for FPGA development.  
- **Documentation**: Explanations of design choices, FPGA constraints, and board-specific quirks.

---

## 📂 Repository Structure

- `/Verilog` – Verilog source files for projects.  
- `/VHDL` – VHDL implementations.  
- `/Constraints` – Constraint files (XDC/UCF) tailored for the Nexys A7-100T.  
- `/Docs` – Additional resources, guides, and notes.  
- `/Scripts` – Helper shell/Python scripts to automate tasks.  

---

## 🛠 Requirements

To replicate and test the projects, you will need:

- Digilent **Nexys A7-100T FPGA board**  
- Xilinx **Vivado Design Suite** (WebPACK or Standard Edition)  
- A working installation of **USB drivers** for Digilent boards  
- Optional: USB-to-UART terminal software (e.g., PuTTY, TeraTerm)

---

## 📖 Getting Started

1. **Clone the repository**  
   ```bash
   git clone https://github.com/KD5VMF/Nexys-A7-100T.git
   cd Nexys-A7-100T
   ```

2. **Open Vivado**  
   - Create a new project.  
   - Add the relevant HDL files and constraints from this repo.  
   - Synthesize, implement, and generate the bitstream.  

3. **Program the Board**  
   - Connect the Nexys A7-100T via USB.  
   - Open the Hardware Manager in Vivado.  
   - Program the FPGA with the generated `.bit` file.  

---

## 🌟 Featured Projects

- **LED Blinker** – The classic "Hello World" for FPGA.  
- **7-Segment Display Counter** – Multi-digit display driver and counter logic.  
- **UART Prime Calculator** – A prime number generator printing results via UART.  
- **Snake Game (VGA)** – Simple VGA-based snake game implementation.  
- **Ethernet MAC + NTP Client** – Hardware networking project running directly on the FPGA.  

Each project comes with source code and a description in its folder.

---

## 🤝 Contributing

Contributions are welcome!  
Feel free to fork the repo, submit pull requests, or open issues with suggestions and improvements.

---

## 📜 License

This repository is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

## ✨ Acknowledgements

- [Digilent](https://digilent.com) for the Nexys A7-100T board.  
- [Xilinx](https://www.xilinx.com) for the Vivado Design Suite.  
- The open-source FPGA community for continuous inspiration.  

---

⭐ If you find this repo helpful, don’t forget to **star it on GitHub**! ⭐

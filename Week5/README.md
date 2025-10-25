# VSD Hardware Design Program

## OpenROAD installation guide

### 📚 Contents

  - [Steps to Install OpenROAD and Run GUI](#steps-to-install-openroad-and-run-gui)
    - [1. Clone the OpenROAD Repository](#1-clone-the-openroad-repository)
    - [2. Run the Setup Script](#2-run-the-setup-script)
    - [3. Build OpenROAD](#3-build-openroad)
    - [4. Verify Installation](#4-verify-installation)
    - [5. Run the OpenROAD Flow](#5-run-the-openroad-flow)
    - [6. Launch the GUI](#6-launch-the-graphical-user-interface-gui-to-visualize-the-final-layout)
- [ORFS Directory Structure and File Formats](#orfs-directory-structure-and-file-formats)


**OpenROAD** is an open-source, fully automated RTL-to-GDSII flow for digital integrated circuit (IC) design. It supports synthesis, floorplanning, placement, clock tree synthesis, routing, and final layout generation. OpenROAD enables rapid design iterations, making it ideal for academic research and industry prototyping.

### `Steps to Install OpenROAD and Run GUI`

### 1. Clone the OpenROAD Repository

```bash
git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
cd OpenROAD-flow-scripts
```

### 2. Run the Setup Script

```bash
sudo ./setup.sh
```
<img width="856" height="279" alt="Screenshot 2025-10-25 225931" src="https://github.com/user-attachments/assets/114cd77f-d598-4d4c-b6dd-6bbd2c315736" />

### 3. Build OpenROAD

```bash
./build_openroad.sh --local
```

<img width="471" height="281" alt="Screenshot 2025-10-25 230046" src="https://github.com/user-attachments/assets/4cb73946-7f5c-4a69-bfa3-82901591ed07" />


### 4. Verify Installation

```bash
source ./env.sh
yosys -help  
openroad -help
```
<img width="876" height="356" alt="Screenshot 2025-10-25 230114" src="https://github.com/user-attachments/assets/fbcbdc75-c877-41a1-ade8-88a713786917" />

<img width="858" height="142" alt="Screenshot 2025-10-25 230147" src="https://github.com/user-attachments/assets/c7112b99-177e-499f-9f9c-8a18a164922e" />


### 5. Run the OpenROAD Flow

```bash
cd flow
make
```

<img width="776" height="392" alt="Screenshot 2025-10-25 230231" src="https://github.com/user-attachments/assets/fe55c5c8-6331-40b0-9502-f286e9d37743" />

### 6. Launch the graphical user interface (GUI) to visualize the final layout

```bash
 make gui_final
```

<img width="389" height="241" alt="Screenshot 2025-10-25 230307" src="https://github.com/user-attachments/assets/85200ac2-63c6-4f30-83a4-4c43aa41b21f" />

<img width="849" height="415" alt="Screenshot 2025-10-25 230320" src="https://github.com/user-attachments/assets/f6be781c-a1bd-407e-9d31-cdd0b8c16f35" />

✅ Installation Complete! You can now explore the full RTL-to-GDSII flow using OpenROAD.

### `ORFS Directory Structure and File formats`

OpenROAD-flow-scripts/

```plaintext
├── OpenROAD-flow-scripts             
│   ├── docker           -> It has Docker based installation, run scripts and all saved here
│   ├── docs             -> Documentation for OpenROAD or its flow scripts.  
│   ├── flow             -> Files related to run RTL to GDS flow  
|   ├── jenkins          -> It contains the regression test designed for each build update
│   ├── tools            -> It contains all the required tools to run RTL to GDS flow
│   ├── etc              -> Has the dependency installer script and other things
│   ├── setup_env.sh     -> Its the source file to source all our OpenROAD rules to run the RTL to GDS flow
```
Inside the `flow/` Directory

```plaintext
├── flow           
│   ├── design           -> It has built-in examples from RTL to GDS flow across different technology nodes
│   ├── makefile         -> The automated flow runs through makefile setup
│   ├── platform         -> It has different technology note libraries, lef files, GDS etc 
|   ├── tutorials        
│   ├── util            
│   ├── scripts                 
```

<img width="733" height="219" alt="Screenshot 2025-10-25 230646" src="https://github.com/user-attachments/assets/dba41cba-f396-45bf-aca7-96ee59b05530" />

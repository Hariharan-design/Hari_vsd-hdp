# My Hardware Design Program

|  Day |       Topics      |          Link          |
|------|-------------------|------------------------|
| Day0 | Tool Installation | [Day0](Day0/README.md) |



# VSD Hardware Design Program — Day 0  
## Tools Installation

All the instructions for installing the required tools.

---

### 🖥️ System Requirements
- 6 GB RAM  
- 50 GB HDD  
- Ubuntu 20.04 or higher  
- 4 vCPU  

---

### **Resizing the Ubuntu window to fit the screen**
```bash
$ sudo apt update
$ sudo apt install build-essential dkms linux-headers-$(uname -r)
$ cd /media/spatha/VBox_GAs_7.1.8/
$ ./autorun.sh
```

### **TOOL CHECK**

#### <ins>**Yosys**</ins>
```bash
$ sudo apt-get update
$ git clone https://github.com/YosysHQ/yosys.git
$ cd yosys
$ sudo apt install make               # If make is not installed
$ sudo apt-get install build-essential clang bison flex \
    libreadline-dev gawk tcl-dev libffi-dev git \
    graphviz xdot pkg-config python3 libboost-system-dev \
    libboost-python-dev libboost-filesystem-dev zlib1g-dev
$ make config-gcc
# Yosys build depends on a Git submodule called abc, which hasn't been initialized yet. You need to run the following command before running make
$ git submodule update --init --recursive
$ make 
$ sudo make install
```
(<img width="1154" height="469" alt="Screenshot 2025-09-20 235928" src="https://github.com/user-attachments/assets/457f1a94-c87e-40d7-b9ed-bfdc35dadee4" />

#### <ins>**Iverilog**</ins>
```bash
$ sudo apt-get update
$ sudo apt-get install iverilog
```
<img width="733" height="213" alt="Screenshot 2025-09-20 235149" src="https://github.com/user-attachments/assets/11ae4550-e279-4562-ac92-b1752f276525" />


#### <ins>**gtkwave**</ins>
```bash
$ sudo apt-get update
$ sudo apt install gtkwave
```
<img width="838" height="680" alt="Screenshot 2025-09-20 235546" src="https://github.com/user-attachments/assets/03994378-ac5b-439a-88f5-367e20e715a3" />

#### <ins>**ngspice**</ins>
After downloading the tarball from https://sourceforge.net/projects/ngspice/files/ to a local directory, unpack it using:
```bash
$ tar -zxvf ngspice-37.tar.gz
$ cd ngspice-37
$ mkdir release
$ cd release
$ ../configure  --with-x --with-readline=yes --disable-debug
$ make
$ sudo make install
```
![Alt Text](Images/ngspice_installatio<img width="1177" height="197" alt="Screenshot 2025-09-20 235902" src="https://github.com/user-attachments/assets/0d855255-2d03-47c7-9b48-ab04df42e188" />
_done.jpeg)

#### <ins>**magic**</ins>
Install the required dependencies:
```bash
$ sudo apt-get install m4
$ sudo apt-get install tcsh
$ sudo apt-get install csh
$ sudo apt-get install libx11-dev
$ sudo apt-get install tcl-dev tk-dev
$ sudo apt-get install libcairo2-dev
$ sudo apt-get install mesa-common-dev libglu1-mesa-dev
$ sudo apt-get install libncurses-dev
```


Clone and build Magic:
```bash
$ git clone https://github.com/RTimothyEdwards/magic
$ cd magic
$ ./configure
$ make
$ sudo make install
```
<img width="1175" height="760" alt="Screenshot 2025-09-20 235718" src="https://github.com/user-attachments/assets/1f3ac49b-d127-41ea-8db9-cc1a81ea2355" />

### <ins>**Tool Versions**</ins>
```bash
$ git --version
$ docker --version
$ python3 --version
$ python3 -m pip --version
$ make --version
```
<img width="734" height="305" alt="Screenshot 2025-09-20 235439" src="https://github.com/user-attachments/assets/0e9f1d66-b4ad-4b33-8920-052671be8fab" />




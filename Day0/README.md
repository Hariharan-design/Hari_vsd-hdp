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

### 🔧 Resizing the Ubuntu window

sudo apt update
sudo apt install build-essential dkms linux-headers-$(uname -r)
cd /media/spatha/VBox_GAs_7.1.8/
./autorun.sh

YOSIS:
sudo apt-get update
git clone https://github.com/YosysHQ/yosys.git
cd yosys
sudo apt install make
sudo apt-get install build-essential clang bison flex \
    libreadline-dev gawk tcl-dev libffi-dev git \
    graphviz xdot pkg-config python3 libboost-system-dev \
    libboost-python-dev libboost-filesystem-dev zlib1g-dev
make config-gcc
git submodule update --init --recursive
make
sudo make install

iverilog:
sudo apt-get update
sudo apt-get install iverilog

GTKWave:
sudo apt-get update
sudo apt install gtkwave

ngspice:
tar -zxvf ngspice-37.tar.gz
cd ngspice-37
mkdir release && cd release
../configure  --with-x --with-readline=yes --disable-debug
make
sudo make install


magic:
sudo apt-get install m4 tcsh csh libx11-dev tcl-dev tk-dev \
    libcairo2-dev mesa-common-dev libglu1-mesa-dev libncurses-dev
git clone https://github.com/RTimothyEdwards/magic
cd magic
./configure
make
sudo make install


Tool Versions:
git --version
docker --version
python3 --version
python3 -m pip --version
make --version








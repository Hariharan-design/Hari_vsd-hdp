# VSD Hardware Design Program

## Velocity Saturation and basics of CMOS inverter VTC

### 📚 Contents

- [SPICE Simulation for Lower Nodes](#spice-simulation-for-lower-nodes)
  - [Observation 1: Long Channel vs. Short Channel NMOS Characteristics](#observation-1-long-channel-vs-short-channel-nmos-characteristics)
  - [Observation 2: Peak Current Comparison — Long Channel vs Short Channel Devices](#observation-2-peak-current-comparison--long-channel-vs-short-channel-devices)
- [Labs: Sky130 Id-Vgs](#labs-sky130-id-vgs)
- [CMOS Voltage Transfer Characteristics](#cmos-voltage-transfer-characteristics)
- [CMOS Inverter — Transistor-Level and Switch-Level View](#cmos-inverter--transistor-level-and-switch-level-view)
- [Load Line Curves for NMOS and PMOS](#load-line-curves-for-nmos-and-pmos)

### `SPICE simulation for lower nodes`

The plot below shows the output characteristics of an NMOS device with W=1.8μm, L=1.2μm (W/L = 1.5).

<img width="1860" height="738" alt="Screenshot 2025-10-17 194138" src="https://github.com/user-attachments/assets/3c974bb8-b1bc-4ff5-9b66-8102ce20b608" />

**Linear Region:**  
  The drain current (Id) is a linear function of Vds in this region.  
  It is defined for Vds < (Vgs - Vt).

**Saturation Region:**  
  The drain current (Id) depends on channel length modulation and Vds.  
  It is defined for Vds ≥ (Vgs - Vt).

The region **before** Vds = Vgs - Vt is the **Linear Region**, where Id varies linearly with Vds.  
The region **after** Vds = Vgs - Vt is the **Saturation Region**, where Id is influenced by channel length modulation and Vds.

#### Observation 1: Long Channel vs. Short Channel NMOS Characteristics

The plot below compares NMOS output characteristics for long channel and short channel devices with **same W/L ratio**:

<img width="898" height="513" alt="Screenshot 2025-10-17 195448" src="https://github.com/user-attachments/assets/00b8be15-64c2-4f1f-850a-ff8b67f64cc8" />

In this figure, the **left plot** corresponds to a device with W = 1.8μm and L = 1.2μm (long-channel device), and the **right plot** corresponds to W = 0.375μm and L = 0.25μm (short-channel device). 

Since the channel length is < 0.25μm in the second case, it is classified as a short-channel device.

Both devices have the **same W/L ratio**, but different absolute Width (W) and Length (L), allowing us to compare their electrical behavior directly.

When we apply a constant Vds and sweep Vgs:

> In **long-channel devices**, the drain current (Id) shows an **ideal quadratic dependence on Vgs**.

> In **short-channel devices**, Id remains quadratic at low Vgs but gradually becomes **linear at higher Vgs**. This is due to **velocity saturation**, which limits carrier velocity as the electric field increases. Once the carrier velocity reaches its maximum limit (velocity saturation), the Id-Vgs curve flattens into a linear region.

Thus, this plot clearly demonstrates how **velocity saturation** alters the Id behavior in short-channel devices — causing a transition from quadratic to linear dependence at higher Vgs.

<img width="812" height="424" alt="Screenshot 2025-10-17 200020" src="https://github.com/user-attachments/assets/2dc04da4-fc1e-4bce-a1bf-73ee135a5b19" />

For long-channel devices, drain current shows a quadratic dependence on gate voltage.

For short-channel devices, it is quadratic at low gate voltage but becomes linear at higher voltages due to velocity saturation.

<img width="910" height="508" alt="Screenshot 2025-10-17 200727" src="https://github.com/user-attachments/assets/86fbe87f-65b2-4606-9463-c24f2377a37a" />

At lower electric fields, carrier velocity increases linearly with the electric field.

At higher electric fields, velocity saturates and becomes constant due to velocity saturation.

<img width="902" height="509" alt="Screenshot 2025-10-17 215146" src="https://github.com/user-attachments/assets/37d421fd-2b39-4897-8225-b29d480c736b" />

<img width="899" height="510" alt="Screenshot 2025-10-17 215509" src="https://github.com/user-attachments/assets/fafe6648-1430-424e-a377-c9edd1d81c51" />

For **Long Channel (> 250 nm)** devices:
  - Modes: Cutoff → Resistive → Saturation

For **Short Channel (< 250 nm)** devices:
  - Modes: Cutoff → Resistive → **Velocity Saturation** → Saturation
  - An additional mode appears due to **velocity saturation** effects in short channel devices.

<img width="896" height="497" alt="Screenshot 2025-10-17 220101" src="https://github.com/user-attachments/assets/cf7e3869-672c-40f7-82e1-4dc473befc2d" />

<img width="922" height="515" alt="Screenshot 2025-10-17 220258" src="https://github.com/user-attachments/assets/7ab7f043-c208-4e29-b0ba-3db932ebc14f" />

<img width="883" height="502" alt="Screenshot 2025-10-17 220451" src="https://github.com/user-attachments/assets/dad3466e-dc50-409f-b9d0-f05aad122105" />

<img width="903" height="504" alt="Screenshot 2025-10-17 220720" src="https://github.com/user-attachments/assets/32b08297-69d6-4129-87e0-a0a8e3dd6cae" />

#### Observation 2: Peak Current Comparison — Long Channel vs Short Channel Devices

The figure below compares the **peak drain current (Id)** between a long-channel and short-channel NMOS device:

<img width="902" height="514" alt="Screenshot 2025-10-17 220826" src="https://github.com/user-attachments/assets/3745f70f-5225-4b4c-bd75-f767a1089740" />

**Left Plot**: W = 1.8μm, L = 1.2μm → **Long-channel device**
  - Peak current = **410 μA**
  
**Right Plot**: W = 0.375μm, L = 0.25μm → **Short-channel device**
  - Peak current = **210 μA**

Even though **short-channel devices** allow for faster switching and smaller sizes, their **peak drain current (Id)** is lower than long-channel devices.

The reduction in peak current is due to **velocity saturation** — which limits carrier velocity in short-channel devices.

In long-channel devices, carriers accelerate freely, giving higher Id.

 ### `Labs Sky130 Id-Vgs`

 <details> <summary><strong>day2_nfet_idvds_L015_W039.spice </strong></summary>

```
  *Model Description
  .param temp=27

  *Including sky130 library files
  .lib "sky130_fd_pr/models/sky130.lib.spice" tt

  *Netlist Description
   XM1 Vdd n1 0 0 sky130_fd_pr__nfet_01v8 w=0.39 l=0.15
   R1 n1 in 55
   Vdd vdd 0 1.8V
   Vin in 0 1.8V

  *simulation commands
   .op
   .dc Vdd 0 1.8 0.1 Vin 0 1.8 0.2

   .control

   run
   display
   setplot dc1
   .endc
   .end
```
</details>

📈**plot the waveforms in ngspice**

```shell
ngspice day2_nfet_idvds_L015_W039.spice 
plot -vdd#branch
```

**The plot of Ids vs Vds over constant Vgs:**

<img width="954" height="591" alt="Screenshot 2025-10-17 222358" src="https://github.com/user-attachments/assets/9e778415-04bf-4279-8715-91612963c534" />

 <details> <summary><strong>day2_nfet_idvgs_L015_W039.spice </strong></summary>

```
    *Model Description
   .param temp=27

   *Including sky130 library files
   .lib "sky130_fd_pr/models/sky130.lib.spice" tt

   *Netlist Description
    XM1 Vdd n1 0 0 sky130_fd_pr__nfet_01v8 w=0.39 l=0.15
    R1 n1 in 55
    Vdd vdd 0 1.8V
    Vin in 0 1.8V

    *simulation commands
     .op
    .dc Vin 0 1.8 0.1 

    .control

     run
     display
     setplot dc1
     .endc
     .end
```
</details>

📈**plot the waveforms in ngspice**

```shell
ngspice day2_nfet_idvgs_L015_W039.spice
plot -vdd#branch
```

**The plot of Ids vs Vgs over constant Vds:**

<img width="954" height="622" alt="Screenshot 2025-10-17 222738" src="https://github.com/user-attachments/assets/80c3ae45-cc2a-4287-8ec0-f006b1896d75" />


### `CMOS voltage Transfer Characteristics`

**MOSFET as a Switch:**

- **OFF State:**  
  The MOSFET behaves as an **open switch** (infinite OFF resistance) when:  
  _|Vgs| < |Vth|_

- **ON State:**  
  The MOSFET behaves as a **closed switch** (finite ON resistance) when:  
  _|Vgs| > |Vth|_

<img width="912" height="508" alt="Screenshot 2025-10-17 225215" src="https://github.com/user-attachments/assets/706138e7-7f0f-4fa3-bcbf-9292aa05fbc0" />

<img width="897" height="510" alt="Screenshot 2025-10-17 230649" src="https://github.com/user-attachments/assets/c7759690-5865-48db-8d60-41024862365e" />

<img width="905" height="512" alt="Screenshot 2025-10-17 230852" src="https://github.com/user-attachments/assets/95b55a7d-0a46-4cc2-8ede-8f0a12aeadd4" />

### `CMOS Inverter — Transistor-Level and Switch-Level View`

The figure below shows the **CMOS inverter** in both **transistor-level** and **switch-level** representations:

<img width="903" height="505" alt="Screenshot 2025-10-17 231318" src="https://github.com/user-attachments/assets/086b923b-ddc1-47a9-935d-d06d7feb2f3c" />

The **left diagram** shows a CMOS inverter at the transistor level: the **PMOS** transistor is connected to Vdd, the **NMOS** transistor is connected to Vss, and **Vin** is applied to both gates. The output **Vout** is taken from the common drain node, with CL representing the load capacitance.

The **middle diagram** illustrates the switch model when **Vin = Vdd**: the NMOS transistor is ON (acting as a resistor Rn), while the PMOS is OFF (open switch), resulting in **Vout = 0**.

The **right diagram** shows the switch model when **Vin = 0**: the PMOS transistor is ON (acting as a resistor Rp), while the NMOS is OFF (open switch), producing **Vout = Vdd**.

> When **Vin = Vdd → Vout = 0** (NMOS ON, PMOS OFF)

> When **Vin = 0 → Vout = Vdd** (PMOS ON, NMOS OFF)

This basic **CMOS inverter** behavior is the foundation of all CMOS logic circuits — demonstrating **low static power** and **sharp transitions** in the voltage transfer characteristics.

### `Load Line Curves for NMOS and PMOS`

> **Step 1**

Convert the **PMOS gate-source voltage (VgsP)** into an equivalent **Vin**.

Replace all internal node voltages with **Vin**, **Vdd**, **Vss**, and **Vout**.

<img width="1424" height="773" alt="Screenshot 2025-10-17 234147" src="https://github.com/user-attachments/assets/8f0b5009-f3a4-4244-98e1-f68ce948b60c" />

> **Step 2 & Step 3**

Convert PMOS and NMOS drain-source voltages to **Vout**.

<img width="1465" height="787" alt="Screenshot 2025-10-17 234521" src="https://github.com/user-attachments/assets/8217575f-9296-4064-a35e-ec1cbb8ca480" />

> **Step 4**

Merge the NMOS and PMOS load curves by equating their Ids characteristics with respect to **Vout**.  

Plot the **Voltage Transfer Characteristic (VTC)** by sweeping **Vin** and mapping the corresponding **Vout**, showing the inverter switching behavior from logic HIGH to LOW.

<img width="1507" height="780" alt="Screenshot 2025-10-17 235107" src="https://github.com/user-attachments/assets/a6c1b553-f9ea-4f2b-b439-199cf2aadfad" />


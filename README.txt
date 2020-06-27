This is the code for the 2020 Thesis of Myrin Naidoo
Prepared for Proffesor Francois Schonken
Title: Low Cost Direct Digital Synthesis Using an FPGA
This folder contains 3 full vivado projects and 2 seperate verilog files.
The three full projects are:
- DAC version 	-the version of the code that attempted to convert the output to analog
		-Untested on hardware

- Final Version -Complete
		-Full version of the code running at the simulator clock speed
		-Uses 29 sine sample values per wavelength

- High Frequency Version
		-Full version of code running at the simulator clock speed
		-Uses 8 sine samples values per wavelength

The 2 verilog files are:
- TestBench Ideal Version
		-This can be used with Final Version -Complete instead of the test bench it contains
		-Uses 0.018 clock pulses for one clock pulse

- SingleValue 1949 bit Input Signal generator
		- This can be used in place of the signal generator in - Final Version -Complete
		-Signal generator and Sine Generator are not to be confused
		-Accepts one 1949 bit input as the input bitsteam for quadrature modulation
		-Untested as it used 1949 bits as an input
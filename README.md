# DAS-Configuration


*DAS-Configuration* provides simulated channels, limit/alarm monitoring, view pages, report templates, test procedures to demonstrate the data acquisition capabilities of proDAS or nxDAS.

> Before starting to copying or merging the files, backup your system so you can revert any mistake.

## Version History

### 1.0.0-alpha
Features and Improvements:
- DAS Configuration
	- Standardizes the demo channel definition
		- DAS
			- ATP
			- Mathematical calculations
			- Simulations
			- Non-english language support
			- Invoke Script demonstrations
			- DAS control
			- DAS monitoring
		- Compressor Map
			- Simulation
			- Polynomial Overalays
			- BreakPoint Table Overlays
		- Jet Engines
			- Simulation from Idle to Take-Off
		- Bellmouth Mass Flow
			- Troubleshooting
			- Simulation
		- Industrial Gas Turbine
			- Performance Calculations
			- Mechanical Verification Test
			- Thermodynamic Verification Test
			- Simulation with Test Procedure
		- Emissions
			- Standardization calculations
	- Standardizes the engineering unit definition
		- Updates unit description
		- Corrects format consistency
		- Modifies the units: g, radians, radians/s, g/l, Btu(Int), Hz/cst, Mile(US), gram, ton(long), ton(metric), ton(short), kg/hr, kg/m, HP(UK), inH2O(4DegC), inHg(0DegC), mmH2O(4DegC), mmHg(0DegC), DegK, hr, cst, gal(Im), gal(US), pint(Im), pint(US), qt(Im), qt(US), gph(Im), gph(US), gpm(Im), gpm(US), gps(Im), gps(US), L/hr, qt(Im)/hr, qt(US)/hr
			- by: g-force, rad, rad/s, g/L, BTU, Hz/cSt, mi, g, t_long, t, t_short, kg/h, kg/min, HP, inH2O, inHg, mmH2O, mmHg, K, h, cSt, gal_UK, gal_US, pt_UK, pt_US, qt_UK, qt_US, gph_UK, gph_US, gpm_UK, gpm_US, gps_UK, gps_US, L/h, qt_UK/h, qt_US/h
		- Updates name or add the following units: cm/s^2, in/s^2, rev, deg/min, deg/sec, rad/min, C, kohm, mohm, ohm, Btu, ft∙lbf, dyn, g/kN∙s, lb/lbf∙h, cm^2/s, m^2/s, mm^2/s, St, cm, dam, dm, hm, km, thou, um, t_lg, t_sh, lb/ft^3, g/min, ft∙lbf/s, hp, PS, bara, inH2O_4degC, inH2O_60degF, inHg_32degF, inHg_60degF, kgf/cm^2, kPaa, mbara, lbf/ft^2, Paa, Btu/lb, ft/min, km/h, d, mth, wk, y, ft∙lbf, in∙lbf, N∙m, ft^3, mL, oz_UK, oz_US, count, h.min, min.s, ratio, TBD
		- Updates descriptions of the following units: Bars Absolute, British Thermal Units, Centimetres, Centimetres/Square Second, Coulombs, Counters, Cubic Feet, Days, Decimetres, Degrees/Minute, Degrees/Second, Dekametres, Dimensionless, Dynes, Feet/Minute, Fluid Ounces (British Imperial), Fluid Ounces (US), Foot Pound-Force, Foot Pounds-Force, Foot Pounds-Force/Second, Grams of Fuel/Second-Kilonewton, Grams/Min, Hectometres, Horsepower (Mechanical), Horsepower (Metric), Hours.Minutes, Inch Pound-Force, Inch/Square Second, Inches of Mercury, Inches of Mercury (32degF), Inches of Mercury (60degF), Inches of Water Column (4 degC), Inches of Water Column (60 degF), Inches of Water Column (Conventional), Kilograms-Force/Square Centimetre, Kilohms, Kilometers/Hour, Kilometres, Kilopascals Absolute, Micrometres, Millibars Absolute, Millilitres, Milliohms, Minutes.Seconds, Months, Newton Metres, Pascals Absolute, Pounds of Fuel/Hour-Pound of Thrust, Pounds/Cubic Foot, Pounds-Force, Pounds-Force/Square Foot, Radians/Minute, Revolutions, Square Centimetres/Second, Square Metres/Second, Square Millimetres/Second, Stokes, To Be Determined, Weeks, Years
		- Updates name of the following categories: Electric Charge, Speed, Fuel Efficiency, Kinetic Viscosity, Mass Density, Turbine Flow Meter
		- Merges Rotational Speed and Angular Velocity categories and update conversion factors accordingly
		- Updates the number of significant digits depending on accuracy relevancy
		- Modifies lbm to lb
		- Adds oz to Weight and change existing oz to fl oz for volume to prevent confusion between Volume and Mass.
		- Changes t_sh and t_lg to sh tn and lg tn
		- Changes category Percent to Percentage
		- Adds vppm unit
		- Adds new category Dynamic Viscosity and Specific Heat Capacity to comply with 508 project required units
		- Adds bracket to the denominator for Fuel Efficiency units to prevent confusion. Add kg/(daN h) to comply with 478 project.
		- Adds new Volumetric Flow and Energy units for 543 project
		- Updates the number of significant digits depending on accuracy relevancy
		- Adds a new category Energy Density
		- Adds Molar quantity, Molar volume, Gas constant units
		- Adds Temperature Drift and Pressure Drift units: degC/s, degC/min, degF/min, degF/s, K/min, K/s, psi/s, kPa/s
		- Adds Molar Mass units for emissions calculations: g/mol, kg/mol
		- Adds d.h for Counter - RunTime
		- Adds Extra angle units: grad, arcmin, quad, arcsec
		- Adds extra units from RR units as reference: g/dm^3, g/m^3,  lbf/in^2, Ma, mi/min, mi/s
		- Adds y.d for the new standard RTD pages
	- Updates the macros definition
- Ini Files
	- Imports legacy ini files
- Invoke Script
	- Incorporates example of the invoke script action in the channel definition
		- Plays a sound
			- proDAs is operational
			- nxDAS is operational
			- Audio buzzer 
		- Displays a message box
- Test Procedure
	- Adds demo test procedures
	- Standardizes test procedure template
	- Adds a test procedure to demonstrate sequentially all RTD pages
	- Adds an endurance test procedure that test all logs and fullsets continuously 
- MgtGUI Scripts
	- Imports the legacy scripts
- RAVE Report Templates
	- Modernizes legacy master log sheet
		- Incorporates new MDS logo
		- Incorporates new Style
		- Improves header with additional fields and a configuration tab
- RTD Pages
	- Adds a dark RTD template 1920 x 1200
	- Adds a new ribbon with DAS control and DAS monitoring features
	- Adds a DAS control RTD pages
	- Adds an ATP RTD pages to demonstrate all RTD ActiveX objects 
	- Adds a demo Compressor Map RTD pages
	- Adds a demo Jet Engines RTD pages
	- Adds a demo Bellmouth Mass Flow Troubleshooting RTD page
	- Adds a demo Industrial Gas Turbine RTD pages
	- Adds a demo Emissions RTD page
	- Adds a demo sequence
- Palettes
	- Standardizes sub drawing definition
	- Standardizes bitmap definition
- Media
	- Records screen captures of the RTD pages for Marketing

----

### 1.0.0
Features and Improvements:
- DAS Configuration
	- Standardizes the transient log definition
- Ini Files
	- Modifies RAVE.ini
		- Data Origin set to I23
	- Modifies MgtGUI.ini
		- Adds fullset test steps for Industrial Gas Turbine testing
	- Modifies RTDActiveXControls.ini
		- Dead time set to 0 by default
		- Highlight Size set to 30 by default
		- Highlight Rotation set to 0 by default
		- Fixes RTD State Indicator default bitmap to `\\rtehost\rte\Palette\Indicator_SubDrawing.bmp`
- MgtGUI Scripts
	- Improves StartScan and StopScan scripts to manage up to 3 RTD Driver instances per computer (Better Strip Chart performances) 
- RTE .config File
	- Standardizes the RTE .config file
		- Splits the file into two sections: Sofware and Hardware subsystems
		- Rearranges the subsystem sections by alphabetical order
		- Adds mention "default" to default value or parameters
		- Improves style and cleanup code
		- Tests in MSIL

----

### 1.1.0
Features and Improvements:
- Adds screen captures of RTD pages, notably Compressor Map and Industrial Gas Turbine
- Adds screen captures of MgtGUI interface while RTE is scanning

----

### 1.1.1
Features and Improvements:
- Adds monitor photos MgtGUI and RTD monitors (3 monitors all combined) running Test Procedures and RTD pages

----

### 1.1.2

Bug Fixes:
- Deletes duplicate subsystems in RTE .config file

----

### 1.1.3

Bug Fixes:
- Modifies README structure
- Updates "Data Server" section of RTE .config file for MSIL to prevent error messages

----

### 1.2.0

Features and Improvements:
- Update StartScan.vbs
	- Adds the capability to start up to 4 RTD Driver instances per computer
	- Adds the capability to choose how many RTD Driver instances are started per computer if monitors quantities are different
	- Adds the capability to Start RTD Driver instance with no View creation (useful for MgtGUI)
	- Clarifies script with comments and variables for every monitor of every computer possible

Bug Fixes:
- RTE .config File
	- Adds missing attributes #PV4 #543 #534

----

### 1.2.1

Bug Fixes:
- Updates StartScan.vbs

----

### 1.3.0

Features and Improvements:
- Removes all "proDAS" mention in channels definition and replace it by "DAS" to facilitate porting to nxDAS
	- Update all RTD pages accordingly (a lot of remapping), notably the new ribbon with DAS control and DAS monitoring features
- Adds Full HD 1920x1080 RTD templates (FHD_0_Template_1920_1080.v, FHD_0_Template_1920_1080_Panel.v)
	- Adds 2 examples (FHD_2_Calculations.v and FHD_2_Simulations.v)
	- Updates the Sequence.xml accordingly
- Adds a light theme RTD template 1920 x 1200 (W_0_Template_1920_1200.v, W_0_Template_1920_1200_Panel.v)
	- Adds 1 example (FW_2_Calculations.v)
	- Updates the Sequence.xml accordingly
	- Adds screen captures of the new RTD pages

Bug Fixes:
- RTE .config File
	- Corrects attribute "la_ch_ack_on" by "la_ch_ack_one"
	- Moves RTE .config file references to Reference folder
	- Adds 508 RTE .config file to Reference
	- Adds 534 RTE .config file to Reference
	- Adds 543 RTE .config file to Reference

----

### 1.3.1

Bug Fixes:
- Updates documentation

----

### 1.4.0

Features and Improvements:

-Compressor Maps
	- Adds drop-down list in the left panel of the demo compressor RTD page to preset test points and control the time response of the command.
	- Updates existing demo compressor Test Procedure to automatically record fullset points with independent test step per compressor speed
	- Adds a similar demo compressor Test Procedure to record fullset points automatically without test steps
	- Adds a Compressor Map RTD page with four graphs that record data from different test step with various persistency
	- Adds a Compressor Map RTD page with four graphs  (two graphs with a dark theme) that record data from separate test step with various persistency
	- Adds new screen captures of the latest Compressor Map RTD pages while running the demo Compressor Map Test Procedure

- RAVE Logsheet
	- Added screen captures of the new RAVE logsheet design

- List RTD Pages
	- Adds two new RTD pages: List and List Compact
	- Adds screen captures of the latest List RTD pages

- RTE .config File
	- Adds Sample RTE .config file (from PV) to Reference

----

### 1.5.0 (CURRENT!)

Features and Improvements:

- Adds a Selector (drop-down list) to the Compressor Maps RTD page without Panel (full screen YX plot)
- Modifies the Compressor Maps channels equations to simulate more accurately test data
- Corrects the Clock RTD page that had wrong mapped channels
- Adds a "PBS Status" capability example with:
	- 2 PBS Status channels
	- a PBS_Status RTD page template 
- Updates the Media repository with updated screen captures of the new RTD pages
- Replaces "MSIL Pictures 1" by a timelapse video of "DAS_Screensaver" Test Procedure 
	- Full resolution video [here](https://1drv.ms/u/s!As9sh526xKAShZcRbeLm5ZkwK5sNLg?e=27EvGZ)


----

### 1.6.0 (alpha)

Features and Improvements:
- Create a Thrust Calibration RTD page
- Automate the Jet Engine Vibration Survey RTD page

----

### 2.0.0 (development)
Features and Improvements:
- nxDAS integration


## Installation for proDAS

The files have to be copied in specific directories as follows:

### Configuration

Management GUI Computer  `C:\proDAS\Data`

### Invoke_Script

Management GUI Computer  `C:\proDAS\Data\MgtGUI`

### JOA

Management GUI Computer  `C:\proDAS\Data\MgtGUI\Test_Procedure`

### MgtGUI

Management GUI Computer  `C:\proDAS\Data\MgtGUI\`

### ini

Management GUI Computer  `C:\proDAS\`

### Palette

Real-Time Engine Computer  `\\rtehost\rte\views`

### X115C

Real-Time Engine Computer  `\\rtehost\rte`

### Media

The folder contains screen captures.

## Installation for nxDAS

Coming soon.

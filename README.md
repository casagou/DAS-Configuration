# DAS-Configuration


*DAS-Configuration* provides simulated channels, limit/alarm monitoring, view pages, report templates, test procedures to demonstrate the data acquisition capabilities of proDAS or nxDAS.

> Before starting to copying or merging the files, backup your system so you can revert any mistake.

## Version History

### 1.0.0-alpha
Features and Improvements:
- DAS Configuration
    - Standardized the demo channel definition
        - DAS
            - ATP
            - Mathematical calculations
            - Simulations
            - Non-english language support
            - Invoke Script demonstrations
        - Compressor Map
            - Simulation
        - Jet Engines
            - Simulation
        - Bellmouth Mass Flow
            - Troubleshooting
            - Simulation
        - Industrial Gas Turbine
            - Performance
            - Mechanical Verification Test
            - Thermodynamic Verification Test
        - Emissions RTD
    - Standardized the engineering unit definition
        - Updated unit description. Corrected format consistency.
        - Modified the units: g, radians, radians/s, g/l, Btu(Int), Hz/cst, Mile(US), gram, ton(long), ton(metric), ton(short), kg/hr, kg/m, HP(UK), inH2O(4DegC), inHg(0DegC), mmH2O(4DegC), mmHg(0DegC), DegK, hr, cst, gal(Im), gal(US), pint(Im), pint(US), qt(Im), qt(US), gph(Im), gph(US), gpm(Im), gpm(US), gps(Im), gps(US), L/hr, qt(Im)/hr, qt(US)/hr
            - by: g-force, rad, rad/s, g/L, BTU, Hz/cSt, mi, g, t_long, t, t_short, kg/h, kg/min, HP, inH2O, inHg, mmH2O, mmHg, K, h, cSt, gal_UK, gal_US, pt_UK, pt_US, qt_UK, qt_US, gph_UK, gph_US, gpm_UK, gpm_US, gps_UK, gps_US, L/h, qt_UK/h, qt_US/h
        - Updated name or added the following units: cm/s^2, in/s^2, rev, deg/min, deg/sec, rad/min, C, kohm, mohm, ohm, Btu, ft∙lbf, dyn, g/kN∙s, lb/lbf∙h, cm^2/s, m^2/s, mm^2/s, St, cm, dam, dm, hm, km, thou, um, t_lg, t_sh, lb/ft^3, g/min, ft∙lbf/s, hp, PS, bara, inH2O_4degC, inH2O_60degF, inHg_32degF, inHg_60degF, kgf/cm^2, kPaa, mbara, lbf/ft^2, Paa, Btu/lb, ft/min, km/h, d, mth, wk, y, ft∙lbf, in∙lbf, N∙m, ft^3, mL, oz_UK, oz_US, count, h.min, min.s, ratio, TBD
        - Updated descriptions of the following units: Bars Absolute, British Thermal Units, Centimetres, Centimetres/Square Second, Coulombs, Counters, Cubic Feet, Days, Decimetres, Degrees/Minute, Degrees/Second, Dekametres, Dimensionless, Dynes, Feet/Minute, Fluid Ounces (British Imperial), Fluid Ounces (US), Foot Pound-Force, Foot Pounds-Force, Foot Pounds-Force/Second, Grams of Fuel/Second-Kilonewton, Grams/Min, Hectometres, Horsepower (Mechanical), Horsepower (Metric), Hours.Minutes, Inch Pound-Force, Inch/Square Second, Inches of Mercury, Inches of Mercury (32degF), Inches of Mercury (60degF), Inches of Water Column (4 degC), Inches of Water Column (60 degF), Inches of Water Column (Conventional), Kilograms-Force/Square Centimetre, Kilohms, Kilometers/Hour, Kilometres, Kilopascals Absolute, Micrometres, Millibars Absolute, Millilitres, Milliohms, Minutes.Seconds, Months, Newton Metres, Pascals Absolute, Pounds of Fuel/Hour-Pound of Thrust, Pounds/Cubic Foot, Pounds-Force, Pounds-Force/Square Foot, Radians/Minute, Revolutions, Square Centimetres/Second, Square Metres/Second, Square Millimetres/Second, Stokes, To Be Determined, Weeks, Years
        - Updated name of the following categories: Electric Charge, Speed, Fuel Efficiency, Kinetic Viscosity, Mass Density, Turbine Flow Meter
        - Merged Rotational Speed and Angular Velocity categories and updated conversion factors accordingly
        - Updated the number of significant digits depending on accuracy relevancy
        - Modified lbm to lb
        - Added oz to Weight and changed existing oz to fl oz for volume to prevent confusion between Volume and Mass.
        - Changed t_sh and t_lg to sh tn and lg tn
        - Changed category Percent to Percentage
        - Added vppm unit
        - Added new category Dynamic Viscosity and Specific Heat Capacity to comply with 508 project required units
        - Added bracket to the denominator for Fuel Efficiency units to prevent confusion. Added kg/(daN h) to comply with 478 project.
        - Added new Volumetric Flow and Energy units for 543 project
        - Updated the number of significant digits depending on accuracy relevancy
        - Added a new category Energy Density
        - Added Molar quantity, Molar volume, Gas constant units
        - Added Temperature Drift and Pressure Drift units: degC/s, degC/min, degF/min, degF/s, K/min, K/s, psi/s, kPa/s
        - Added Molar Mass units for emissions calculations: g/mol, kg/mol
        - Added d.h for Counter - RunTime
        - Added Extra angle units: grad, arcmin, quad, arcsec
        - Added extra units from RR units as reference: g/dm^3, g/m^3,  lbf/in^2, Ma, mi/min, mi/s
        - Added y.d for the new standard RTD pages
    - Updated the macros definition
- Ini Files
    - Imported legacy ini files
- Invoke Script
    - Incorporated example of the invoke script action in the channel definition
        - Play a sound
            - proDAs is operational
            - nxDAS is operational
            - Audio buzzer 
        - Display a message box
- Test Procedure
    - Created demo test procedures
    - Standardized test procedure template
    - Created a test procedure to demonstrate all RTD pages
    - Created an endurance test procedure that test all logs and fullsets continuously 
- MgtGUI Scripts
    - Imported legacy scripts
- RAVE Report Templates
    - Improved existing legacy master log sheet
        - Incorporated new MDS logo
        - Improved header with more fields and a configuration tab
- RTE .config File
- RTD Pages
    - Created dark templates RTD page 1920 x 1200
    - Created DAS control RTD pages
    - Created ATP RTD pages to demonstrate all RTD ActiveX objects 
    - Created demo Compressor Map RTD pages
    - Created demo Jet Engines RTD pages
    - Created demo Bellmouth Mass Flow Troubleshooting RTD page
    - Created demo Industrial Gas Turbine RTD pages
    - Created demo Emissions RTD page
- Palettes
    - Standardized sub drawing definition
    - Standardized bitmap definition
- Media
    - Recorded screen captures of the RTD pages for Marketing

### 1.0.0
Features and Improvements:
- DAS Configuration
    - Standardized the transient log definition
- Ini Files
    - Modified RAVE.ini
        - Data Origin set to I23
    - MgtGUI.ini
        - Added fullset test steps for Industrial Gas Turbine testing
    - RTDActiveXControls.ini
        - Dead time set to 0 by default
        - Highlight Size set to 30 by default
        - Highlight Rotation set to 0 by default
        - Fixed RTD State Indicator default bitmap to `\\rtehost\rte\Palette\Indicator_SubDrawing.bmp`
- MgtGUI Scripts
    - Improved StartScan and StopScan scripts to manage up to 3 RTD Driver instances per computer
- RTE .config File
    - Standardized the RTE .config file
        - Split the file into 2 sections: Sofware subsystems and Hardware subsystems
        - Rearranged the subsystems section by alphabetical order
        - Added "default" value mentions
        - Improved style and cleanup code
        - Tested in MSIL

### 1.1.0
Features and Improvements:
- Added screen captures of RTD pages, notably Compressor Map and Industrial Gas Turbine
- Added screen captures of MgtGUI interface while RTE is scanning

### 1.1.1
Features and Improvements:
- Added monitor photos MgtGUI and RTD monitors all combined running Test Procedures and RTD pages

### 1.1.2 (current)

### 1.2.0 (alpha)

Features and Improvements:
- Create a compressor Map split view with extra overlays
- Replace all "proDAS" channels by "DAS" channels 
- Create a Thrust Calibration RTD page
- Improve the Jet Engine Vibration Survey RTD page

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

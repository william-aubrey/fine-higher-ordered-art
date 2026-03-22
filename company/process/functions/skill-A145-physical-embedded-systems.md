# Skill File: Physical and Embedded Systems Engineering

**Node:** A145
**Parent:** A14 Engineering
**Function:** Engineer Physical and Embedded Systems
**Supreme Constraint:** [PHYS-THERMO] Laws of Thermodynamics; [FMEA] Failure Mode and Effects Analysis; [ISO-9001] Quality Management
**Cross-Function Interfaces:** IF-A1-05 (A14 → A2+A3 — physical product/process plans), IF-A1-07 (A14 → People Headcount Requisition)
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18 (L5) — confirmed at sprint close
**Mandatory Inclusions Verified:**
- [x] MTTR/MTTF failure mode analysis — [FMEA] → A1455 / A14551–A14553
- [x] Manufacturing process engineering — per A145 scope note → A1456 / A14561–A14563

*Scope note: A145 covers both product engineering (designing the physical product: mechanical, electrical, firmware, embedded AI) AND manufacturing process engineering (designing the facility and assembly line: layout, flow, lean methods, SPC). Embedded/robotics AI (perception stacks, control loops, sensor fusion) belongs here per enterprise model note. Currently future-scope for Ouborobo — leaf nodes are universal definitions applicable when A145 activates.*

---

## A145: Engineer Physical and Embedded Systems

**Function:** Design, prototype, test, and prepare for manufacture physical products and embedded systems including mechanical assemblies, electronic circuits, firmware, and embedded AI
**Supreme Constraint:** [PHYS-THERMO]; [FMEA]; [ISO-9001]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Product Requirements | physical product specifications from Principal / Product |
| I2 | Input | Technical Architecture Standards | from A141 — engineering standards |
| I3 | Input | Compliance Operating Envelope | IF-A1-03 — safety regulations, product certifications |
| C1 | Control | [PHYS-THERMO] Laws of Thermodynamics | energy, heat, material constraints |
| C2 | Control | [FMEA] Failure Mode and Effects Analysis | reliability analysis |
| C3 | Control | [ISO-9001] Quality Management System | design control and NCR process |
| C4 | Control | Security Architecture Standards | from A1415 — embedded system security |
| O1 | Output | Mechanical Design Package | CAD models, drawings, mechanical BOM |
| O2 | Output | Electrical Design Package | schematics, PCB layouts, electronic BOM |
| O3 | Output | Firmware and Embedded AI Software | tested embedded code |
| O4 | Output | Prototype Validation Results | test data confirming design meets specifications |
| O5 | Output | FMEA Analysis Records | failure mode register with RPN scores and mitigations |
| O6 | Output | Manufacturing Process Plans | assembly specs, facility layout, SPC parameters → A2 via IF-A1-05 |
| M1 | Mechanism | [MECH-IDE] IDE | firmware development |
| M2 | Mechanism | [MECH-SCM] Source Code Management | firmware and design file version control |
| M3 | Mechanism | [MECH-CLOUD] Cloud Provider API | simulation compute |

**Child Nodes:** A1451, A1452, A1453, A1454, A1455, A1456

### Boundary Arrow Correspondence (A145)

| A145 Code | Produced By | Notes |
|---|---|---|
| O1 Mechanical Design Package | A1451.O3 | released mechanical design |
| O2 Electrical Design Package | A1452.O3 | released electrical design |
| O3 Firmware and Embedded AI Software | A1453.O3 | released embedded software |
| O4 Prototype Validation Results | A1454.O3 | validation test report |
| O5 FMEA Analysis Records | A1455.O3 | FMEA register with mitigations |
| O6 Manufacturing Process Plans | A1456.O3 | released manufacturing package → IF-A1-05 |

### Internal Arrows (A145 diagram)

| # | From | To | Role | Label |
|---|---|---|---|---|
| 1 | A1451.O3 | A1454 | Input | Mechanical Design (prototype build input) |
| 2 | A1452.O3 | A1454 | Input | Electrical Design (prototype build input) |
| 3 | A1453.O3 | A1454 | Input | Firmware (prototype flash input) |
| 4 | A1454.O3 | A1455 | Input | Validation Results (FMEA input) |
| 5 | A1455.O3 | A1451 | Control | FMEA Findings (design revision feedback) |
| 6 | A1451.O3 + A1452.O3 | A1456 | Input | Design Packages (manufacturing process source) |

---

### A1451: Design Mechanical Systems and Generate CAD Models

**Function:** Design Mechanical Systems and Generate CAD Models
**Supreme Constraint:** [PHYS-THERMO]; [ISO-9001]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Product Requirements | form factor, operating environment, load specifications |
| I2 | Input | FMEA Findings | from A1455 — design revision feedback (iterative) |
| C1 | Control | [PHYS-THERMO] Laws of Thermodynamics | thermal budget, structural stress limits |
| C2 | Control | [ISO-9001] Quality Management System | design control |
| O1 | Output | 3D CAD Models | assemblies and components in STEP/IGES format |
| O2 | Output | 2D Engineering Drawings | GD&T per ASME Y14.5, material callouts, surface finishes |
| O3 | Output | Released Mechanical Design Package | CAD + drawings + mechanical BOM, version-controlled |
| M1 | Mechanism | [MECH-CAD] CAD Software (SolidWorks, Fusion 360, Onshape) | mechanical design |
| M2 | Mechanism | [MECH-SCM] Source Code Management | CAD file version control |

**Child Nodes:** A14511, A14512, A14513

---

### A1452: Design Electrical Systems and PCB Layouts

**Function:** Design Electrical Systems and PCB Layouts
**Supreme Constraint:** [PHYS-THERMO]; [ISO-25010]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Product Requirements | electrical specifications, I/O, power budget |
| C1 | Control | [PHYS-THERMO] Laws of Thermodynamics | power budget (draw ≤ supply capacity; thermal dissipation) |
| C2 | Control | [ISO-25010] Software Quality Model | PCB design quality |
| O1 | Output | Electrical Schematics | circuit diagrams with component values and net names |
| O2 | Output | PCB Layout and Gerber Files | board layout, routing, manufacturing files |
| O3 | Output | Released Electrical Design Package | schematics + PCB + electronic BOM, version-controlled |
| M1 | Mechanism | [MECH-EDA] EDA Software (KiCad, Altium Designer) | schematic and PCB design |
| M2 | Mechanism | [MECH-SCM] Source Code Management | schematic version control |

**Child Nodes:** A14521, A14522, A14523

---

### A1453: Develop Embedded Firmware and AI Software

**Function:** Develop Embedded Firmware and AI Software
**Supreme Constraint:** [ISO-25010]; [MATH-BIGO]; [OWASP-TOP10]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Electrical Schematics | from A1452 — hardware interface definitions |
| I2 | Input | Product Requirements | control behavior, sensor processing, AI specifications |
| C1 | Control | [ISO-25010] Software Quality Model | reliability, security, maintainability |
| C2 | Control | [MATH-BIGO] Computational Complexity | real-time performance constraints |
| C3 | Control | [OWASP-TOP10] OWASP Top 10 | embedded security |
| O1 | Output | Firmware Source Code | control logic, communication protocols, sensor drivers |
| O2 | Output | Embedded AI Software | perception stacks, control loops, on-device inference |
| O3 | Output | Released Embedded Software Package | firmware + AI code with tests, version-tagged |
| M1 | Mechanism | [MECH-IDE] IDE (PlatformIO, STM32CubeIDE, VS Code) | firmware development |
| M2 | Mechanism | [MECH-SCM] Source Code Management (GitHub) | version control |
| M3 | Mechanism | [MECH-CLOUD] Cloud Provider API | AI model training compute |

**Child Nodes:** A14531, A14532, A14533

---

### A1454: Prototype and Validate Physical Systems

**Function:** Prototype and Validate Physical Systems
**Supreme Constraint:** [ISO-9001]; [PHYS-THERMO]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Released Mechanical Design Package | from A1451.O3 |
| I2 | Input | Released Electrical Design Package | from A1452.O3 |
| I3 | Input | Released Embedded Software Package | from A1453.O3 |
| C1 | Control | [ISO-9001] Quality Management System | design verification and validation procedures |
| C2 | Control | [PHYS-THERMO] Laws of Thermodynamics | thermal and structural test parameters |
| O1 | Output | Assembled Prototype Units | functional prototypes with build records |
| O2 | Output | Test Execution Records | per-test: procedure, measurements, pass/fail |
| O3 | Output | Prototype Validation Test Report | comprehensive report with overall pass/fail determination |
| M1 | Mechanism | [MECH-PROTO] Prototyping Services (3D printing, JLCPCB, PCBWay) | part fabrication |
| M2 | Mechanism | [MECH-TEST] Test & Measurement Equipment (oscilloscopes, thermal chambers, vibration tables) | measurement |
| M3 | Mechanism | [MECH-DOC] Document Collaboration | test documentation |

**Child Nodes:** A14541, A14542, A14543

---

### A1455: Conduct Failure Mode Analysis and Risk Mitigation

**Function:** Conduct Failure Mode Analysis and Risk Mitigation
**Supreme Constraint:** [FMEA]; [ISO-9001]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Prototype Validation Test Report | from A1454.O3 — observed failure data |
| I2 | Input | Design Packages | from A1451, A1452, A1453 — design under analysis |
| C1 | Control | [FMEA] Failure Mode and Effects Analysis | RPN = Severity × Occurrence × Detection |
| C2 | Control | [ISO-9001] Quality Management System | CAPA process |
| O1 | Output | FMEA Register | per-failure-mode: function, failure mode, effect, S, O, D, RPN, mitigation |
| O2 | Output | Design Revision Recommendations | changes to reduce RPN below threshold |
| O3 | Output | FMEA Analysis Package | register + recommendations + MTTR/MTTF estimates |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | FMEA documentation |
| M2 | Mechanism | [MECH-LLM] LLM API | failure mode identification |

**Child Nodes:** A14551, A14552, A14553

---

### A1456: Design Manufacturing Processes and Facility Layout

**Function:** Design Manufacturing Processes and Facility Layout
**Supreme Constraint:** [LEAN]; [SIXSIGMA]; [ISO-9001]

*Scope note: Manufacturing process engineering — designing the facility and assembly line. Currently future-scope for Ouborobo but defined universally.*

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Released Design Packages | from A1451, A1452 — product to manufacture |
| I2 | Input | FMEA Analysis Package | from A1455.O3 — critical control points |
| C1 | Control | [LEAN] Lean Manufacturing Principles | waste elimination, value stream |
| C2 | Control | [SIXSIGMA] Six Sigma DMAIC | process capability (Cpk ≥ 1.33) |
| C3 | Control | [ISO-9001] Quality Management System | process validation |
| O1 | Output | Assembly Process Specifications | step-by-step procedures with quality checkpoints |
| O2 | Output | Facility Layout and Flow Diagrams | floor plan with workstations and material flow |
| O3 | Output | Released Manufacturing Process Plan | specs + layout + SPC → A2 Production via IF-A1-05 |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | process documentation |
| M2 | Mechanism | [MECH-BI] Business Intelligence | SPC dashboards |

**Child Nodes:** A14561, A14562, A14563

---

## Leaf Node Definitions (L5 — 18 nodes)

---

#### A14511: Create 3D CAD Models for All Mechanical Assemblies

**Agent Definition:** Create parametric 3D CAD models for all mechanical assemblies and components, specifying material selections, dimensional tolerances, and interference checks, and validate that the design satisfies thermal and structural constraints.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Product Requirements | form factor, load specifications, operating environment |
| C1 | Control | [PHYS-THERMO] Laws of Thermodynamics | thermal: power dissipation ≤ heat rejection capacity; structural: applied stress ≤ material yield strength |
| O1 | Output | 3D CAD Models | parametric assemblies in STEP/IGES with material assignments and interference check report |
| M1 | Mechanism | [MECH-CAD] CAD Software (SolidWorks, Fusion 360, Onshape) | 3D modeling |

**Definition of Done:** CAD models cover all mechanical assemblies AND interference check reports zero collisions AND material selections are specified AND thermal analysis confirms power dissipation ≤ heat rejection capacity.

---

#### A14512: Generate 2D Engineering Drawings with GD&T

**Agent Definition:** Generate 2D engineering drawings from the 3D CAD models with geometric dimensioning and tolerancing (GD&T) per ASME Y14.5, material callouts, surface finish specifications, and revision block for each component requiring fabrication.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | 3D CAD Models | from A14511.O1 |
| C1 | Control | [ISO-9001] Quality Management System | drawing standards and revision control |
| O1 | Output | 2D Engineering Drawings | per-component: orthographic views, GD&T callouts, material, surface finish, revision block |
| M1 | Mechanism | [MECH-CAD] CAD Software (SolidWorks, Fusion 360) | drawing generation |
| M2 | Mechanism | [MECH-SCM] Source Code Management | drawing version control |

**Definition of Done:** Every fabricated component has a 2D drawing AND drawings include GD&T per ASME Y14.5 AND material and surface finish are specified AND revision block has current version number.

---

#### A14513: Compile Mechanical BOM and Release Design Package

**Agent Definition:** Compile the mechanical bill of materials from the CAD assembly tree, verify component part numbers and supplier availability, and release the complete mechanical design package (CAD + drawings + BOM) with a version tag in MECH-SCM.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | 3D CAD Models + 2D Drawings | from A14511.O1, A14512.O1 |
| C1 | Control | [ISO-9001] Quality Management System | design release control |
| O1 | Output | Mechanical BOM | component name, part number, material, quantity, supplier, unit cost |
| O2 | Output | Released Mechanical Design Package | CAD + drawings + BOM, version-tagged in MECH-SCM |
| M1 | Mechanism | [MECH-SCM] Source Code Management | version tagging |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | BOM documentation |

**Definition of Done:** BOM lists all mechanical components with part numbers AND supplier is identified for each component AND design package is version-tagged in MECH-SCM AND release branch is protected.

---

#### A14521: Create Electrical Schematics for All Subsystems

**Agent Definition:** Create electrical schematics for all electronic subsystems defining circuit topology, component values, power domains, signal routing, and connector pin assignments.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Product Requirements | electrical specifications, I/O, power budget |
| C1 | Control | [PHYS-THERMO] Laws of Thermodynamics | power budget: total draw ≤ supply capacity; thermal dissipation path |
| O1 | Output | Electrical Schematics | per-subsystem: circuit diagram, component values, net names, power domain map |
| M1 | Mechanism | [MECH-EDA] EDA Software (KiCad, Altium Designer) | schematic capture |

**Definition of Done:** Schematics cover all electronic subsystems AND ERC (electrical rule check) passes with zero errors AND power budget analysis confirms total draw ≤ supply capacity.

---

#### A14522: Design PCB Layouts and Generate Manufacturing Files

**Agent Definition:** Route the PCB layout from the schematics, apply design rules (trace width, clearance, via size), run DRC, and generate gerber files, drill files, and assembly drawings for PCB fabrication.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Electrical Schematics | from A14521.O1 |
| C1 | Control | [ISO-25010] Software Quality Model | PCB reliability (signal integrity, EMC pre-compliance) |
| O1 | Output | PCB Layout | component placement, trace routing, ground planes, via placement |
| O2 | Output | Manufacturing Files | gerber files (copper, mask, silk), drill files, pick-and-place data |
| M1 | Mechanism | [MECH-EDA] EDA Software (KiCad, Altium Designer) | PCB layout and DRC |

**Definition of Done:** PCB layout passes DRC with zero errors AND gerber files are generated AND drill files are generated AND assembly pick-and-place data is exported.

---

#### A14523: Compile Electronic BOM and Release Electrical Design Package

**Agent Definition:** Compile the electronic bill of materials from the schematic component list, verify supplier availability and lead times, identify alternate components, and release the complete electrical design package (schematics + PCB + BOM + manufacturing files) with a version tag.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Schematics + PCB Layout + Manufacturing Files | from A14521.O1, A14522.O1, A14522.O2 |
| C1 | Control | [ISO-9001] Quality Management System | design release control |
| O1 | Output | Electronic BOM | component part number, value, package, quantity, supplier, alternate, unit cost |
| O2 | Output | Released Electrical Design Package | schematics + PCB + BOM + manufacturing files, version-tagged |
| M1 | Mechanism | [MECH-SCM] Source Code Management | version tagging |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | BOM documentation |

**Definition of Done:** BOM lists all electronic components with part numbers AND at least one supplier per component AND alternate components identified for critical parts AND package is version-tagged in MECH-SCM.

---

#### A14531: Develop Embedded Firmware with Unit Tests

**Agent Definition:** Write embedded firmware implementing control logic, communication protocols (UART, SPI, I2C, BLE, Wi-Fi), and sensor/actuator drivers, author unit tests covering all public functions and interrupt handlers, and commit passing code to version control.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Electrical Schematics | from A1452 — hardware interface pin assignments |
| I2 | Input | Product Requirements | control behavior specifications |
| C1 | Control | [ISO-25010] Software Quality Model | reliability and security |
| C2 | Control | [OWASP-TOP10] OWASP Top 10 | embedded security (buffer overflow, authentication) |
| O1 | Output | Firmware Source Code | tested embedded code with unit tests in MECH-SCM |
| M1 | Mechanism | [MECH-IDE] IDE (PlatformIO, STM32CubeIDE, VS Code) | firmware development |
| M2 | Mechanism | [MECH-SCM] Source Code Management (GitHub) | version control |

**Definition of Done:** Firmware compiles for target MCU without errors AND all unit tests pass AND test coverage ≥80% of public functions AND no OWASP Top 10 vulnerability present.

---

#### A14532: Develop Embedded AI Perception and Control Software

**Agent Definition:** Implement embedded AI subsystems — perception stacks (computer vision, sensor fusion), control loops (PID, state machines), and on-device inference — with validation tests against known-correct input/output sequences.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Sensor Specifications | camera, IMU, LiDAR, proximity sensor data formats |
| I2 | Input | Control Requirements | response time, accuracy, safety envelope |
| C1 | Control | [MATH-BIGO] Computational Complexity | inference latency ≤ control loop period |
| C2 | Control | [PHYS-THERMO] Laws of Thermodynamics | on-device compute thermal budget |
| O1 | Output | Embedded AI Software | perception + control + inference code with validation tests |
| M1 | Mechanism | [MECH-IDE] IDE (VS Code, PyTorch Mobile, TensorFlow Lite) | embedded AI development |
| M2 | Mechanism | [MECH-CLOUD] Cloud Provider API | model training compute |

**Definition of Done:** Perception stack processes sensor inputs within control loop period AND validation tests pass ≥95% of known-correct sequences AND thermal budget is not exceeded during sustained operation.

---

#### A14533: Release Embedded Software Package with Version Tag

**Agent Definition:** Integrate firmware and embedded AI software into a unified release build, run integration tests on target hardware (or hardware-in-the-loop simulator), and release the embedded software package with a version tag in MECH-SCM.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Firmware Source Code | from A14531.O1 |
| I2 | Input | Embedded AI Software | from A14532.O1 |
| C1 | Control | [ISO-25010] Software Quality Model | integration quality |
| O1 | Output | Integration Test Results | firmware + AI integration on target hardware: pass/fail |
| O2 | Output | Released Embedded Software Package | unified build, version-tagged in MECH-SCM |
| M1 | Mechanism | [MECH-SCM] Source Code Management | version tagging |
| M2 | Mechanism | [MECH-CICD] CI/CD Pipeline | integration test automation |

**Definition of Done:** Integration tests pass on target hardware or HIL simulator AND embedded software package is version-tagged in MECH-SCM AND release branch is protected.

---

#### A14541: Build Functional Prototypes from Released Designs

**Agent Definition:** Fabricate or procure prototype parts (3D-printed/machined mechanical, fabricated PCBs), flash firmware, assemble all subsystems into functional prototype units, and verify basic power-on self-test.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Released Design Packages | mechanical (A1451.O3), electrical (A1452.O3), firmware (A1453.O3) |
| C1 | Control | [ISO-9001] Quality Management System | prototype build traceability |
| O1 | Output | Assembled Prototype Units | functional prototypes with build records and serial numbers |
| M1 | Mechanism | [MECH-PROTO] Prototyping Services (3D printing, JLCPCB, PCBWay) | part fabrication |

**Definition of Done:** All specified prototype units are assembled AND each unit powers on AND firmware boot self-test passes AND build records trace each unit to its design revision.

---

#### A14542: Execute Design Verification and Validation Test Plans

**Agent Definition:** Execute the verification test plan (environmental, electrical, mechanical stress, EMC pre-compliance) and validation test plan (user scenario, reliability/life testing) against prototype units, recording measurement data and pass/fail per requirement.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Assembled Prototype Units | from A14541.O1 |
| I2 | Input | Product Requirements | acceptance criteria per test |
| C1 | Control | [ISO-9001] Quality Management System | V&V procedures |
| C2 | Control | [PHYS-THERMO] Laws of Thermodynamics | thermal stress test parameters |
| O1 | Output | Test Execution Records | per-test: procedure, measurement data, pass/fail |
| O2 | Output | Prototype Validation Test Report | all tests, overall pass/fail, open issues |
| M1 | Mechanism | [MECH-TEST] Test & Measurement Equipment (oscilloscopes, thermal chambers, vibration tables) | measurement |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | test documentation |

**Definition of Done:** All tests in V&V plan are executed AND each test has measurement data AND overall pass/fail determination is documented AND failing tests have open issues with severity.

---

#### A14543: Compile Design Review Package and Obtain Principal Approval

**Agent Definition:** Assemble the unified product BOM (mechanical + electrical + firmware), preliminary unit cost estimate, prototype validation test report, and design revision history into a design review package and route to Principal for approval gate.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Prototype Validation Test Report | from A14542.O2 |
| I2 | Input | Released Design Packages | from A1451, A1452, A1453 |
| C1 | Control | [ISO-9001] Quality Management System | design review gate |
| O1 | Output | Unified Product BOM | all components with part numbers, quantities, costs |
| O2 | Output | Preliminary Unit Cost Estimate | component costs + estimated assembly labor |
| O3 | Output | Principal-Approved Design Review Package | complete package with approval signature |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | package assembly |
| M2 | Mechanism | [MECH-ESIGN] Electronic Signature | Principal approval |

**Definition of Done:** Unified BOM accounts for all components AND unit cost is computed AND design review package is assembled AND Principal approval signature is captured.

---

#### A14551: Identify Failure Modes and Compute RPN Scores

**Agent Definition:** Enumerate all potential failure modes for each critical subsystem, determine the effect, assign Severity (1–10), Occurrence (1–10), and Detection (1–10) ratings, and compute Risk Priority Number (RPN = S × O × D) for each failure mode.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Prototype Validation Test Report | from A1454.O3 — observed failures |
| I2 | Input | Design Packages | from A1451, A1452, A1453 — design under analysis |
| C1 | Control | [FMEA] Failure Mode and Effects Analysis | RPN formula; severity, occurrence, detection scales |
| O1 | Output | FMEA Register | per-mode: subsystem, function, failure mode, effect, S, O, D, RPN |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | FMEA worksheet |
| M2 | Mechanism | [MECH-LLM] LLM API | failure mode identification |

**Definition of Done:** All critical subsystems have failure modes enumerated AND every mode has S, O, D ratings AND RPN is computed AND modes are sorted by RPN descending.

---

#### A14552: Define Mitigation Actions and Compute MTTR/MTTF Estimates

**Agent Definition:** For each failure mode with RPN above the defined threshold, define a mitigation action (design change, additional detection, or maintenance procedure), compute estimated Mean Time to Failure (MTTF) and Mean Time to Repair (MTTR), and re-score the post-mitigation RPN.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | FMEA Register | from A14551.O1 |
| C1 | Control | [FMEA] Failure Mode and Effects Analysis | post-mitigation RPN must be below threshold |
| O1 | Output | Mitigation Action Plan | per-high-RPN-mode: action, owner, target date, expected S/O/D reduction |
| O2 | Output | MTTR/MTTF Estimates | per-subsystem: estimated MTTF (hours), estimated MTTR (hours) |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | mitigation documentation |

**Definition of Done:** Every failure mode with RPN above threshold has a mitigation action AND post-mitigation RPN is computed AND MTTF and MTTR estimates are produced for all critical subsystems.

---

#### A14553: Produce FMEA Analysis Package with Design Revision Recommendations

**Agent Definition:** Assemble the FMEA register, mitigation actions, MTTR/MTTF estimates, and design revision recommendations into the FMEA Analysis Package, and deliver as a control input to A1451 (mechanical design revision feedback).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | FMEA Register | from A14551.O1 |
| I2 | Input | Mitigation Action Plan + MTTR/MTTF | from A14552.O1, A14552.O2 |
| C1 | Control | [ISO-9001] Quality Management System | CAPA process |
| O1 | Output | FMEA Analysis Package | register + mitigations + MTTR/MTTF + revision recommendations |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | package assembly |
| M2 | Mechanism | [MECH-ESIGN] Electronic Signature | engineering sign-off |

**Definition of Done:** Package contains complete FMEA register AND all mitigations AND MTTR/MTTF estimates AND design revision recommendations are listed AND engineering sign-off is captured.

---

#### A14561: Design Assembly Process Steps and Quality Checkpoints

**Agent Definition:** Define the step-by-step assembly process for the product including workstation assignments, required tools and fixtures, time standards, and quality checkpoints (inspection points, go/no-go gauges, torque specs) at critical stages identified by FMEA.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Released Design Packages | from A1451, A1452 — product to assemble |
| I2 | Input | FMEA Analysis Package | from A1455.O3 — critical control points |
| C1 | Control | [LEAN] Lean Manufacturing Principles | waste elimination; single-piece flow |
| C2 | Control | [ISO-9001] Quality Management System | inspection procedures |
| O1 | Output | Assembly Process Specification | per-step: workstation, tools, time standard, quality checkpoint |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | process documentation |

**Definition of Done:** Every assembly step has a workstation AND tools listed AND time standard AND FMEA-critical steps have quality checkpoints with measurable acceptance criteria.

---

#### A14562: Design Facility Layout and Material Flow

**Agent Definition:** Design the production facility floor layout with workstation placement, material storage, material flow paths, and visual management zones, applying lean principles to minimize transport and motion waste and identify the bottleneck station.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Assembly Process Specification | from A14561.O1 — workstation sequence |
| C1 | Control | [LEAN] Lean Manufacturing Principles | cellular layout, minimize transport |
| C2 | Control | [TOC] Theory of Constraints | design around bottleneck station |
| O1 | Output | Facility Layout Diagram | floor plan with workstations, material flow arrows, storage zones |
| O2 | Output | Material Flow Analysis | transport distances, cycle time per station, bottleneck identification |
| M1 | Mechanism | [MECH-CAD] CAD Software (AutoCAD, SolidWorks) | layout design |

**Definition of Done:** Layout diagram shows all workstations AND material flow paths AND bottleneck station is identified AND transport distances are computed.

---

#### A14563: Define SPC Parameters and Release Manufacturing Process Plan

**Agent Definition:** Define SPC parameters (control chart type, control limits, sample size, sampling frequency) for each FMEA-critical quality characteristic, assemble the complete manufacturing process plan, and release to A2 Production via IF-A1-05.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Assembly Process Specification | from A14561.O1 |
| I2 | Input | Facility Layout | from A14562.O1 |
| I3 | Input | FMEA Register | from A1455.O1 — critical characteristics |
| C1 | Control | [SIXSIGMA] Six Sigma DMAIC | Cpk ≥ 1.33 for critical characteristics |
| C2 | Control | [ISO-9001] Quality Management System | process release control |
| O1 | Output | SPC Parameter Definitions | per-characteristic: chart type, UCL, LCL, sample size, frequency |
| O2 | Output | Released Manufacturing Process Plan | assembly specs + layout + SPC → A2 via IF-A1-05 |
| M1 | Mechanism | [MECH-BI] Business Intelligence | SPC dashboards |
| M2 | Mechanism | [MECH-ESIGN] Electronic Signature | release sign-off |

**Definition of Done:** Every FMEA-critical characteristic has SPC parameters AND control chart type is specified AND manufacturing process plan is assembled AND released with sign-off AND transmitted to A2 via IF-A1-05.

**[CROSS-FUNCTION: A14 → A2]** *Interface: IF-A1-05*

---

## QA Checklist (Post-Sprint Self-Assessment)

- [x] Every L4 and L5 node has exactly one complete IDEF0 block
- [x] No L5 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md
- [x] Every Output (O) names a specific artifact or verifiable state change
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: O1=A1451.O3; O2=A1452.O3; O3=A1453.O3; O4=A1454.O3; O5=A1455.O3; O6=A1456.O3
- [x] No skill appears under more than one function node
- [x] All cross-function interfaces cited: IF-A1-05 (manufacturing process plan → A2)
- [x] No banned verbs without measurable qualifier (R3.4)
- [x] L4 node names are active verb phrases — all 6 verified (R1.2a)
- [x] L5 node names are active verb phrases — all 18 verified (R1.2a)
- [x] Leaf node count confirmed: 18 (3+3+3+3+3+3)
- [x] Mandatory inclusions: FMEA/MTTR/MTTF (A14551–A14553); manufacturing process engineering (A14561–A14563)

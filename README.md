# Lean Manufacturing — OEE Performance Dashboard

End-to-end manufacturing analytics project combining **SQL** and **Power BI** 
to measure factory performance using Lean/OEE metrics.

<img width="1315" height="738" alt="Lean Manufacturing-OEE Dashboard" src="https://github.com/user-attachments/assets/408e0f9c-d44e-4b09-86fd-674500d283d7" />


## Overview
Analyzes 882 production records (6 machines, 3 lines, 2 shifts, 90 days) to 
calculate Overall Equipment Effectiveness (OEE) and related Lean metrics, 
then visualizes them in an interactive Power BI dashboard.

## Metrics
- **OEE** = Availability × Performance × Quality
- Scrap Rate, First Pass Yield, On-Time Delivery, Lead Time
- Breakdowns by Machine, Line, Shift, and Downtime Reason
- Weekly OEE trend

## Key Findings
- Overall OEE: 72.5% (below the 85% world-class benchmark)
- Availability (85%) is the weakest OEE component — driven by downtime
- Top downtime causes: Maintenance, Setup/Changeover, Breakdown
- CNC-01 and CNC-02 show the highest scrap rates

## Tools
SQL (MySQL) · Power BI · DAX · Data Modeling

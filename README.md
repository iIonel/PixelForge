# PixelForge

A lightweight plugin for [Aseprite](https://www.aseprite.org/) that exports a sprite directly into **G-code** for a GRBL-based laser machine. The goal of the project is to provide a seamless bridge between pixel art and CNC laser workflows, without relying on external conversion tools.

## How it works

1. **Artwork preparation in Aseprite**  
   - Create or open a sprite in Aseprite.  
   - Each pixel in the sprite corresponds to a single “dot” in the engraving, scaled according to the pixel size defined in millimeters.

2. **Execution**  
   - Navigate to `File > Scripts > PixelForge –> main.lua`.  
   - A configuration dialog will appear, allowing you to specify parameters (pixel size in mm, feed rate, maximum laser power, threshold, X and Y offsets, machine working area, output file name)

3. **Conversion process**  
   - The plugin converts the sprite into a binary ON/OFF pixel map.  
   - For each row, it generates serpentine scanlines (left → right, then right → left).  
   - Black = laser ON (`S = Smax`), White = laser OFF (`S = 0`).  
   - The Y axis is automatically flipped to match CNC coordinates (origin bottom-left instead of top-left like in Aseprite).

4. **Output result**  
   - The result is a `.gcode` file.
   - This file can be loaded directly into **LaserGRBL** or any other GRBL sender (ex. Lightburn).

---

##  Why it’s useful

- No need to export PNGs and process them with external tools.  
- Direct control over scale, power, and placement.  
- Fits naturally into a pixel art → laser engraving workflow.

---

##  Safety considerations (IMPORTANT!!!)

- Always test at low laser power before running a full job.  
- Double-check that the work area is set correctly for your machine.  
- Use proper laser safety gear.

---

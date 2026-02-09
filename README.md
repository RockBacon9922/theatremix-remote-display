# TheatreMix Remote Display

A TheatreMix companion app that receives OSC and renders the current Cue, Description and Color

<img width="1052" height="463" alt="Screenshot 2026-02-09 at 17 40 54" src="https://github.com/user-attachments/assets/3baf29d2-eafd-48fe-99a3-44f62c6c66bb" />


**Implementation**
- Written in Rust.
- UI built with `eframe`/`egui`.
- OSC networking handled with `rosc`.
- Stores simple local configuration using `dirs`.


**Releases**
- macOS: `.dmg`
- Windows: `.msi`
- Linux: `.deb` and `.rpm`

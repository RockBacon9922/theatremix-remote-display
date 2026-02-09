# TheatreMix Remote Display

A TheatreMix companion app that receives OSC and renders the current Cue, Description and Color

<img width="1052" height="463" alt="Screenshot 2026-02-09 at 20 17 43" src="https://github.com/user-attachments/assets/4176bb3d-9dea-4079-b0cc-0ffa5bc78287" />

**MacOS Security
Once installed, Please go into your applications folder and ctrl + click on the application to bypass MacOS security
<img width="917" height="437" alt="Screenshot 2026-02-09 at 21 29 00" src="https://github.com/user-attachments/assets/b6af6bb1-4f6b-4fc6-80be-972c684e1289" />


**Implementation**
- Written in Rust.
- UI built with `eframe`/`egui`.
- OSC networking handled with `rosc`.
- Stores simple local configuration using `dirs`.


**Releases**
- macOS: `.dmg`
- Windows: `.msi`
- Linux: `.deb` and `.rpm`

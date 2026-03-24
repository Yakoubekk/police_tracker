# 🛰️ Advanced Police Vehicle Tracker (ESX)

A lightweight and highly optimized FiveM script that allows specific duty fractions (Police, GIBS, EMS) to track service vehicles in real-time on the map using blips.

## 🌟 Key Features
- **Job-Locked Access:** Only players with authorized jobs (defined in config) can see the tracking blips.
- **Dynamic Entity Tracking:** Unlike basic scripts, this tracks the **Vehicle Entity** itself. The blip stays on the car even if the driver exits.
- **Customizable Vehicle List:** Define specific spawn codes to be tracked (Octavias, Superbs, Helicopters, etc.).
- **Visual Distinction:** Set unique labels and colors for different units (e.g., Blue for State Police, Red for GIBS/Internal Affairs).
- **Performance Optimized:** Uses `GetGamePool('CVehicle')` with a configurable refresh rate to ensure 0.00ms idle CPU usage.
- **Smart Cleanup:** Blips are automatically removed when a vehicle is deleted, despawned, or when a player goes off-duty.

## 🛠️ Installation

1. Download the repository.
2. Extract the `police_tracker` folder into your server's `resources` directory.
3. Add the following line to your `server.cfg`:
   ```cfg
   ensure car_tracker

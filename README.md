# Stormworks-Vehicle-spawner
Spawn vehicles anywhere<br>
![vehicle spawner](https://user-images.githubusercontent.com/28710739/192510795-fa2482f2-7ce2-44c0-996b-b9392b12e3ac.png)<br>

# Info
I've made a simple vehicle spawning addon so you can spawn any vehicle anywhere without fondling with mission editor and any other stuff.<br>
I can't upload this addon to workshop because i don't have game on steam and i can't buy it because i live in Russia, so here we are.

# Instalation
Just drop folder in AppData\Roaming\Stormworks\data\missions<br>

# Command list
## ?help
prints command list in chat</br>
## ?spawnV [vehicleName] [spawnOffsetV] [spawnOffsetH]<br>
usage: ?spawnV helicopter 2 5</br>
vehicleName - your saved vehicle name, without spaces<br>
spawnOffsetV (optional) - horizontal offset of spawning vehicle<br>
spawnOffsetH (optional) - vertical offset of spawning vehicle<br>
if both not specified or set to 0, vehicle will spawn inside you<br>

## ?despawnV [vehicleID]
usage: ?despawnV 621</br>
vehicleID (optional) - ID of a vehicle you want to despawn. If not specified you need to seat in vehicle you want to despawn</br>

# Things i can't or to lazy to fix
* If you enter invalid saved vehicle name it will say vehicle spawned and give you id, but nothing actuly will spawn
* You can't spawn vehicles with spaces in save name, it's a problem with onCustomCommand function that will treat all words with spaces as separate arguments

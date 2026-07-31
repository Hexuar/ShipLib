# ShipLib
A library datapack providing functionality for ships. Used by **Norse Adventure**.

## Usage
When creating a datapack utilising **ShipLib**, there are a couple of function tags you'll need to implement. These should all be added to `shiplib/tags/function/ships`. For more information, check out [**Norse Adventure**](https://github.com/Hexuar/Norse-Adventure/).

---

### `load_data.json`
Should contain the path to a function which saves the stats for your ships into a scoreboard. For **Norse adventure** this looks like the following:
```MCFUNCTION
function norse_adventure:ships/karve/load_data
function norse_adventure:ships/knarr/load_data
function norse_adventure:ships/skeid/load_data
```
The `load_data` function for the karve then looks something like this:
```MCFUNCTION
scoreboard players set #norse_adventure.karve shiplib.max_speed 6
scoreboard players set #norse_adventure.karve shiplib.min_speed -1
scoreboard players set #norse_adventure.karve shiplib.speed_increment 1

scoreboard players set #norse_adventure.karve shiplib.max_rotation 9
scoreboard players set #norse_adventure.karve shiplib.min_rotation -9
scoreboard players set #norse_adventure.karve shiplib.rotation_increment 3
```

---

### `set_data.json`
Should contain the path to a function which is run when applying the ship stats to a specific ship. This is done on spawning and reloading, in case ship stats change.
```MCFUNCTION
execute if entity @s[tag=norse_adventure.ship.karve] run function norse_adventure:ships/karve/set_data
execute if entity @s[tag=norse_adventure.ship.knarr] run function norse_adventure:ships/knarr/set_data
execute if entity @s[tag=norse_adventure.ship.skeid] run function norse_adventure:ships/skeid/set_data
```
For the karve, this `set_data` functions looks like this:
```MCFUNCTION
scoreboard players operation @s shiplib.max_speed = #norse_adventure.karve shiplib.max_speed
scoreboard players operation @s shiplib.min_speed = #norse_adventure.karve shiplib.min_speed
scoreboard players operation @s shiplib.speed_increment = #norse_adventure.karve shiplib.speed_increment

scoreboard players operation @s shiplib.max_rotation = #norse_adventure.karve shiplib.max_rotation
scoreboard players operation @s shiplib.min_rotation = #norse_adventure.karve shiplib.min_rotation
scoreboard players operation @s shiplib.rotation_increment = #norse_adventure.karve shiplib.rotation_increment
```

---

### `summon.json`
Should contain the path to a function which runs separate summoning functions for each of your ships.
```MCFUNCTION
execute if entity @s[tag=norse_adventure.ship.karve] run function norse_adventure:ships/karve/summon
execute if entity @s[tag=norse_adventure.ship.knarr] run function norse_adventure:ships/knarr/summon
execute if entity @s[tag=norse_adventure.ship.skeid] run function norse_adventure:ships/skeid/summon
```
These functions should then set the data for the base `item_display` and spawn in all other components.

---

### `spawn_loot.json`
Should contain the path to a function which summons the item for your ships.
```MCFUNCTION
execute if entity @s[tag=norse_adventure.ship.karve] run loot spawn ~ ~ ~ loot norse_adventure:ships/karve
execute if entity @s[tag=norse_adventure.ship.knarr] run loot spawn ~ ~ ~ loot norse_adventure:ships/knarr
execute if entity @s[tag=norse_adventure.ship.skeid] run loot spawn ~ ~ ~ loot norse_adventure:ships/skeid
```

### `display_steering_ui.json`
Should contain the path to a functíon which displays the steering ui when seated in your ships. This function is passed the parameters `speed` and `rotation` which can be used to display the ships motion.
```MCFUNCTION
$title @p[tag=shiplib.steering_player] actionbar [{translate:"title.norse_adventure.steering_ui", with:["$(speed)","$(rotation)"], color:"gray"}]
```

---

### `assemble.json`
Should contain the path to a function which runs a separate assembly function for each of your ships. For example:
```MCFUNCTION
execute if entity @s[tag=norse_adventure.ship.karve] run function norse_adventure:ships/karve/assemble
execute if entity @s[tag=norse_adventure.ship.knarr] run function norse_adventure:ships/knarr/assemble
execute if entity @s[tag=norse_adventure.ship.skeid] run function norse_adventure:ships/skeid/assemble
```
These assembly functions are run every time the ship moves, and are used to teleport all its pieces into place. For the karve, this looks like the following:
```MCFUNCTION
# Collision Detectors
tp @n[type=marker,tag=shiplib.current,tag=norse_adventure.ship.karve.collision_detector.bow] ^ ^ ^5
tp @n[type=marker,tag=shiplib.current,tag=norse_adventure.ship.karve.collision_detector.aft] ^ ^ ^-5


# Rudder
tp @n[type=area_effect_cloud,tag=shiplib.current,tag=shiplib.ship_part.steering] ^-1.28 ^0.63 ^-3 ~ ~
execute store result entity @s item.components."minecraft:custom_model_data".floats[1] float 1.0 run scoreboard players get @s shiplib.rotation


# Sail interaction
tp @n[type=area_effect_cloud,tag=shiplib.current,tag=shiplib.ship_part.acceleration] ^1.2 ^0.63 ^-3.1


# Seats
tp @n[type=area_effect_cloud,tag=shiplib.current,tag=shiplib.ship_part.seat,tag=norse_adventure.ship.karve.steering_seat] ^ ^-0.3 ^-3.55
tp @n[type=area_effect_cloud,tag=shiplib.current,tag=shiplib.ship_part.seat,tag=norse_adventure.ship.karve.port_seat] ^0.5 ^-0.3 ^2.45
tp @n[type=area_effect_cloud,tag=shiplib.current,tag=shiplib.ship_part.seat,tag=norse_adventure.ship.karve.starboard_seat] ^-0.5 ^-0.3 ^2.45


# Chests
tp @n[type=area_effect_cloud,tag=shiplib.current,tag=norse_adventure.ship.karve.chest] ^ ^-0.94 ^-0.4 ~ ~


# Sail
execute if score @s shiplib.speed matches ..2 run function norse_adventure:ships/karve/sail/tucked
execute if score @s shiplib.speed matches 3..4 run function norse_adventure:ships/karve/sail/half
execute if score @s shiplib.speed matches 5.. run function norse_adventure:ships/karve/sail/full


# Floors
tp @n[type=happy_ghast,tag=shiplib.current,tag=shiplib.ship_part.floor,tag=norse_adventure.ship.karve.floor1] ^ ^-2.55 ^3.5
tp @n[type=happy_ghast,tag=shiplib.current,tag=shiplib.ship_part.floor,tag=norse_adventure.ship.karve.floor2] ^ ^-2.55 ^1
tp @n[type=happy_ghast,tag=shiplib.current,tag=shiplib.ship_part.floor,tag=norse_adventure.ship.karve.floor3] ^ ^-2.55 ^-1.5
tp @n[type=happy_ghast,tag=shiplib.current,tag=shiplib.ship_part.floor,tag=norse_adventure.ship.karve.floor4] ^ ^-2.55 ^-4

```

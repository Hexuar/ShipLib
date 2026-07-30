scoreboard objectives add shiplib.value dummy
scoreboard objectives add shiplib.rotation dummy
scoreboard objectives add shiplib.speed dummy
scoreboard objectives add shiplib.max_speed dummy
scoreboard objectives add shiplib.min_speed dummy
scoreboard objectives add shiplib.speed_increment dummy
scoreboard objectives add shiplib.max_rotation dummy
scoreboard objectives add shiplib.min_rotation dummy
scoreboard objectives add shiplib.rotation_increment dummy
scoreboard objectives add shiplib.has_been_assembled dummy

scoreboard objectives add shiplib.input.forward.pressed dummy
scoreboard objectives add shiplib.input.forward.held dummy
scoreboard objectives add shiplib.input.backward.pressed dummy
scoreboard objectives add shiplib.input.backward.held dummy
scoreboard objectives add shiplib.input.left.pressed dummy
scoreboard objectives add shiplib.input.left.held dummy
scoreboard objectives add shiplib.input.right.pressed dummy
scoreboard objectives add shiplib.input.right.held dummy

scoreboard objectives add shiplib.entityID dummy
scoreboard players add #register shiplib.entityID 0

scoreboard players set #2 shiplib.value 2

scoreboard players set #DISPLAY_STEERING_UI shiplib.value 1

function #shiplib:ships/load_data
execute as @e[type=item_display,tag=shiplib.ship] run function #shiplib:ships/set_data
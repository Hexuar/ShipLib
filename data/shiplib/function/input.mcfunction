scoreboard players set @s[scores={shiplib.input.forward.pressed=1}] shiplib.input.forward.pressed 0
scoreboard players set @s[scores={shiplib.input.forward.held=0},predicate=shiplib:input/forward] shiplib.input.forward.pressed 1
execute unless score @s shiplib.input.forward.held matches 1 run scoreboard players set @s[predicate=shiplib:input/forward] shiplib.input.forward.held 1
scoreboard players set @s[scores={shiplib.input.forward.held=1},predicate=!shiplib:input/forward] shiplib.input.forward.held 0

scoreboard players set @s[scores={shiplib.input.backward.pressed=1}] shiplib.input.backward.pressed 0
scoreboard players set @s[scores={shiplib.input.backward.held=0},predicate=shiplib:input/backward] shiplib.input.backward.pressed 1
execute unless score @s shiplib.input.backward.held matches 1 run scoreboard players set @s[predicate=shiplib:input/backward] shiplib.input.backward.held 1
scoreboard players set @s[scores={shiplib.input.backward.held=1},predicate=!shiplib:input/backward] shiplib.input.backward.held 0

scoreboard players set @s[scores={shiplib.input.left.pressed=1}] shiplib.input.left.pressed 0
scoreboard players set @s[scores={shiplib.input.left.held=0},predicate=shiplib:input/left] shiplib.input.left.pressed 1
execute unless score @s shiplib.input.left.held matches 1 run scoreboard players set @s[predicate=shiplib:input/left] shiplib.input.left.held 1
scoreboard players set @s[scores={shiplib.input.left.held=1},predicate=!shiplib:input/left] shiplib.input.left.held 0

scoreboard players set @s[scores={shiplib.input.right.pressed=1}] shiplib.input.right.pressed 0
scoreboard players set @s[scores={shiplib.input.right.held=0},predicate=shiplib:input/right] shiplib.input.right.pressed 1
execute unless score @s shiplib.input.right.held matches 1 run scoreboard players set @s[predicate=shiplib:input/right] shiplib.input.right.held 1
scoreboard players set @s[scores={shiplib.input.right.held=1},predicate=!shiplib:input/right] shiplib.input.right.held 0
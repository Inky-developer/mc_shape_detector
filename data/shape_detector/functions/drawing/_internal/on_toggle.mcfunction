execute if score @s shape_detector.d matches 0 run data modify storage shape_detector shape set value []

scoreboard players add @s shape_detector.d 1
scoreboard players operation @s shape_detector.d %= 2 constants

execute if score @s shape_detector.d matches 0 run function shape_detector:drawing/_internal/on_stop_drawing
execute if score @s shape_detector.d matches 1 run function shape_detector:drawing/_internal/check_rotation
execute if score @s shape_detector.d matches 1 if score valid shape_detector matches 0 run scoreboard players set @s shape_detector.d 0
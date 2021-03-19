# requires: 
# - path in tmp
# - length of path in length
# - length of path at least 2

execute store result score cur_x shape_detector run data get storage shape_detector tmp[-2] 1000
execute store result score cur_y shape_detector run data get storage shape_detector tmp[-1] 1000
data remove storage shape_detector tmp[-2]
data remove storage shape_detector tmp[-1]

execute store result score pos_x shape_detector run data get entity @s Pos[0] 1000
execute store result score pos_y shape_detector run data get entity @s Pos[1] 1000

scoreboard players operation pos_x shape_detector += cur_x shape_detector
scoreboard players operation pos_y shape_detector += cur_y shape_detector

execute store result entity @e[tag=shape_detector.displayer,limit=1] Pos[0] double 0.001 run scoreboard players get pos_x shape_detector
execute store result entity @e[tag=shape_detector.displayer,limit=1] Pos[1] double 0.001 run scoreboard players get pos_y shape_detector
execute at @e[tag=shape_detector.displayer,limit=1] run particle minecraft:dust 0 0 0 1 ~ ~ ~ 0 0 0 0 1

scoreboard players remove length shape_detector 2
execute if score length shape_detector matches 2.. run function shape_detector:_internal/display_shape
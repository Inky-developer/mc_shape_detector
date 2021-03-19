# gets the position of the particle, where directly forwards is (0|0)
# the area effect cloud is removed when the user stops drawing
summon minecraft:area_effect_cloud ^ ^ ^3 {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["shape_detector.point", "shape_detector.display"]}

execute store result score pos_x shape_detector run data get entity @e[tag=shape_detector.point,limit=1] Pos[0] 1000
execute store result score pos_y shape_detector run data get entity @e[tag=shape_detector.point,limit=1] Pos[1] 1000
#execute store result score pos_z shape_detector run data get entity @e[tag=shape_detector.point,limit=1] Pos[2] 1000

execute store result score dx shape_detector run data get entity @s Pos[0] 1000 
execute store result score dy shape_detector run data get entity @s Pos[1] 1000
#execute store result score dz shape_detector run data get entity @s Pos[2] 1000

scoreboard players operation pos_x shape_detector -= dx shape_detector
scoreboard players operation pos_y shape_detector -= dy shape_detector
#scoreboard players operation pos_z shape_detector -= dz shape_detector

title @a actionbar [{"score":{"name": "pos_x", "objective": "shape_detector"}}, {"text": ", "}, {"score":{"name": "pos_y", "objective": "shape_detector"}}, {"text": ", "}, {"score":{"name": "pos_z", "objective": "shape_detector"}}]
tag @e[tag=shape_detector.point] remove shape_detector.point
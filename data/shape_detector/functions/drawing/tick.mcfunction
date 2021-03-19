execute as @a[scores={shape_detector.c=1..}] run function shape_detector:drawing/_internal/on_toggle
scoreboard players set @a shape_detector.c 0

# execute only every third tick to generated not too many points
scoreboard players operation capture_pos shape_detector = tick shape_detector
scoreboard players operation capture_pos shape_detector %= 3 constants
execute if score capture_pos shape_detector matches 0 as @a[scores={shape_detector.d=1}] at @s anchored eyes run function shape_detector:drawing/_internal/capture_pos

execute at @e[tag=shape_detector.display] run particle dust 0 0 0 2 ~ ~ ~ 0 0 0 0 1
# displays the shape at the current position by iterating over it an moving an area_effect cloud to the respective locations
summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["shape_detector.displayer"]}
data modify storage shape_detector tmp set from storage shape_detector shape 
execute store result score length shape_detector run data get storage shape_detector tmp
execute if score length shape_detector matches 2.. run function shape_detector:_internal/display_shape
kill @e[tag=shape_detector.displayer,limit=1]
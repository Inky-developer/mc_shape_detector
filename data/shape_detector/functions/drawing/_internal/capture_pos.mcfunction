function shape_detector:drawing/get_position
execute store result storage shape_detector next_x double 0.001 run scoreboard players get pos_x shape_detector
execute store result storage shape_detector next_y double 0.001 run scoreboard players get pos_y shape_detector

data modify storage shape_detector shape append from storage shape_detector next_x 
data modify storage shape_detector shape append from storage shape_detector next_y 
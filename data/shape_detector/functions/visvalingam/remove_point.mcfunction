# finds the least useful point and removes it from this list
# requires:
#  - shape 

function shape_detector:visvalingam/find_triangle_areas

data modify storage shape_detector tmp set from storage shape_detector shape
data modify storage shape_detector tmp2 set value []
execute store result score cur_index shape_detector run data get storage shape_detector tmp

scoreboard players operation target_index shape_detector = min_index shape_detector
execute unless score cur_index shape_detector matches 6.. run data modify storage shape_detector tmp2 set from storage shape_detector shape
execute if score cur_index shape_detector matches 6.. run function shape_detector:visvalingam/_internal/remove_point

data modify storage shape_detector shape set from storage shape_detector tmp2 
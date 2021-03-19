# this function iterates over the points in shape and finds the smallest rectangle
# output:
#  - min_area: The area of the smallest triangle * 1000
#  - min_index: The index of the point with the smallest triangle, 0 beeing the last element

data modify storage shape_detector tmp set from storage shape_detector shape
execute store result score length shape_detector run data get storage shape_detector tmp
scoreboard players set min_area shape_detector 2147483647
scoreboard players set min_index shape_detector 0
scoreboard players set cur_index shape_detector 0
execute if score length shape_detector matches 6.. run function shape_detector:visvalingam/_internal/find_triangle_areas
scoreboard players add min_index shape_detector 2
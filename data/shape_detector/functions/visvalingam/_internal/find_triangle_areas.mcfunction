# recursively calculates the triangles areas and returnes the (negative) index of the smallest area
# requires:
#  - at least 6 entries in tmp
#  - length of tmp in length
#  - min_area of 2^31-1 at first call
#  - cur_index of 0 at first call

function shape_detector:visvalingam/_internal/calculate_triangle_area
data remove storage shape_detector tmp[-2]
data remove storage shape_detector tmp[-1]
scoreboard players remove length shape_detector 2

execute if score result shape_detector < min_area shape_detector run scoreboard players operation min_index shape_detector = cur_index shape_detector
execute if score result shape_detector < min_area shape_detector run scoreboard players operation min_area shape_detector = result shape_detector
#tellraw @a {"score":{"name":"result","objective":"shape_detector"}}
scoreboard players add cur_index shape_detector 2

execute if score length shape_detector matches 6.. run function shape_detector:visvalingam/_internal/find_triangle_areas
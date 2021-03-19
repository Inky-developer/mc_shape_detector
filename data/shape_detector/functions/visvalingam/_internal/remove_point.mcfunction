# builds a new points list with the point at index min_index removed.
# this functions takes up a huge portion of the runtime, so optimizing this could give
# significant performance improvements.

# requires:
#  - tmp: A copy of the shape which may be destroyed
#  - tmp2: An empty list
#  - target_index: The index of the point to remove, where 0 is the last point of tmp
#  - cur_index: The current index counter, which should be the length of tmp when this is called
# outputs:
#  - tmp2: A copy of tmp with the point at target_index removed

execute unless score target_index shape_detector matches 0 run data modify storage shape_detector tmp2 prepend from storage shape_detector tmp[-1]
execute unless score target_index shape_detector matches 0 run data modify storage shape_detector tmp2 prepend from storage shape_detector tmp[-2]
data remove storage shape_detector tmp[-2]
data remove storage shape_detector tmp[-1]

scoreboard players remove target_index shape_detector 2
scoreboard players remove cur_index shape_detector 2

execute unless score cur_index shape_detector matches 0 run function shape_detector:visvalingam/_internal/remove_point
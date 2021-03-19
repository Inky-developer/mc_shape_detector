# removes points until the minimal area is larger than threshold
# depending on the number of points, this function can execute thousands of commands. This could be optimized.
# for example, right now all triangle areas are calculated everytime a point gets removed.
# requires:
#  - shape: The shape
#  - threshold: The threshold until to remove points

function shape_detector:visvalingam/find_triangle_areas
execute if score min_area shape_detector < threshold shape_detector run function shape_detector:visvalingam/_internal/remove_until
# detects the shape of the points in shape, simplifying it in the process
# the value for threshold is arbitrary and can be tweaked!
scoreboard players set threshold shape_detector 300000
function shape_detector:visvalingam/remove_until

execute store result score num_points shape_detector run data get storage shape_detector shape
scoreboard players operation num_points shape_detector /= 2 constants
scoreboard players remove num_points shape_detector 1

# calculate the distance between first and last point to determine whether the shape is closed
execute store result score pos_x shape_detector run data get storage shape_detector shape[0] 10
execute store result score pos_y shape_detector run data get storage shape_detector shape[1] 10
execute store result score dx shape_detector run data get storage shape_detector shape[-2] 10
execute store result score dy shape_detector run data get storage shape_detector shape[-1] 10
scoreboard players operation pos_x shape_detector -= dx shape_detector
scoreboard players operation pos_y shape_detector -= dy shape_detector
scoreboard players operation pos_x shape_detector *= pos_x shape_detector
scoreboard players operation pos_y shape_detector *= pos_y shape_detector
scoreboard players operation pos_x shape_detector += pos_y shape_detector
# the value of 100 is an arbitrary choice and could be tweaked
execute store result score is_closed shape_detector if score pos_x shape_detector matches ..100

execute if score num_points shape_detector matches 0 run say Point!
execute if score num_points shape_detector matches 1 if score is_closed shape_detector matches 1 run say Point!
execute if score num_points shape_detector matches 1 if score is_closed shape_detector matches 0 run say Line!
execute if score num_points shape_detector matches 2 run say Curved Line!
execute if score num_points shape_detector matches 3 if score is_closed shape_detector matches 1 run say Triangle!
execute if score num_points shape_detector matches 4 if score is_closed shape_detector matches 1 run say Rectangle!
execute if score num_points shape_detector matches 5 if score is_closed shape_detector matches 1 run say Pentagon!
execute if score num_points shape_detector matches 6.. if score is_closed shape_detector matches 1 run say Circle!
execute if score num_points shape_detector matches 3.. if score is_closed shape_detector matches 0 run say Sorry, I could not recognize this shape!
# requires:
#  - tmp: the shape

execute store result score next_y shape_detector run data get storage shape_detector tmp[-1] 1000
execute store result score next_x shape_detector run data get storage shape_detector tmp[-2] 1000
execute store result score cur_y shape_detector run data get storage shape_detector tmp[-3] 1000
execute store result score cur_x shape_detector run data get storage shape_detector tmp[-4] 1000
execute store result score prev_y shape_detector run data get storage shape_detector tmp[-5] 1000
execute store result score prev_x shape_detector run data get storage shape_detector tmp[-6] 1000

# The area is 1/2 * |prev_x*cur_y + cur_x*next_y + next_x*prev_y - prev_x*next_y - cur_x*prev_y - next_x*cur_y|
scoreboard players operation result shape_detector = prev_x shape_detector
scoreboard players operation result shape_detector *= cur_y shape_detector

scoreboard players operation tmp shape_detector = cur_x shape_detector
scoreboard players operation tmp shape_detector *= next_y shape_detector
scoreboard players operation result shape_detector += tmp shape_detector

scoreboard players operation tmp shape_detector = next_x shape_detector
scoreboard players operation tmp shape_detector *= prev_y shape_detector
scoreboard players operation result shape_detector += tmp shape_detector

scoreboard players operation tmp shape_detector = prev_x shape_detector
scoreboard players operation tmp shape_detector *= next_y shape_detector
scoreboard players operation result shape_detector -= tmp shape_detector

scoreboard players operation tmp shape_detector = cur_x shape_detector
scoreboard players operation tmp shape_detector *= prev_y shape_detector
scoreboard players operation result shape_detector -= tmp shape_detector

scoreboard players operation tmp shape_detector = next_x shape_detector
scoreboard players operation tmp shape_detector *= cur_y shape_detector
scoreboard players operation result shape_detector -= tmp shape_detector

execute if score result shape_detector matches ..0 run scoreboard players operation result shape_detector *= -1 constants
# technically unneeded command
scoreboard players operation result shape_detector /= 2 constants

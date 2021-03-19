#declare storage shape_detector

scoreboard objectives add shape_detector dummy
scoreboard players set tick shape_detector 0

scoreboard objectives add shape_detector.d dummy
scoreboard objectives add shape_detector.c used:carrot_on_a_stick
scoreboard objectives add constants dummy
scoreboard players set -1 constants -1
scoreboard players set 2 constants 2
scoreboard players set 3 constants 3
scoreboard players set 5 constants 5

# this contains the list of points of the form [x1, y1, x2, y2, ...] which make up the shape. Every function operates on this list.
# For performance reasons the used indexes are reversed, ie. index zero targets the last element.
data modify storage shape_detector shape set value []

tellraw @a [{"text": "Loaded ", "color": "gold"}, {"text": "shape_detector", "color": "gray", "underlined": true}]
execute unless score loaded shape_detector matches 1 run tellraw @a {"text": "This is a proof of concept and not fully fledged out. Important things like multiplayer compatibility are not implemented yet. Also, everything is only implemented for 2d points. This means, that when drawing the points you must be facing north or south. If the shape got recognized incorrectly, try drawing a smaller shape. To start drawing, give yourself a carrot on a stick and right-click with it. To stop drawing right-click again."}
scoreboard players set loaded shape_detector 1
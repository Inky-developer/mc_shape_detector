# checks that the player is rotated north or south, with 50 degrees of leeway
execute store result score rotation shape_detector run data get entity @s Rotation[0]

scoreboard players set valid shape_detector 0
execute if score rotation shape_detector matches ..-320 run scoreboard players set valid shape_detector 1
execute if score rotation shape_detector matches -50.. run scoreboard players set valid shape_detector 1
execute if score rotation shape_detector matches -230..-130 run scoreboard players set valid shape_detector 1
execute if score valid shape_detector matches 0 run say invalid rotation. Please face north or south.
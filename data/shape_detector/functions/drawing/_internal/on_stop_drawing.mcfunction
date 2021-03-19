say stopped!
#data modify storage shape_detector shape append from storage shape_detector shape[0]
#data modify storage shape_detector shape append from storage shape_detector shape[1]
#data remove storage shape_detector shape[1]
#data remove storage shape_detector shape[0]
kill @e[tag=shape_detector.display]
function shape_detector:detect_shape
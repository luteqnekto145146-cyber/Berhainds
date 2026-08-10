/// @DnDAction : YoYo Games.Movement.Set_Direction_Point
/// @DnDVersion : 1
/// @DnDHash : 6F6892D3
/// @DnDArgument : "x" "obv_vzriv.x - obj_beg_terrei.x"
/// @DnDArgument : "y" "obv_vzriv.y - obj_beg_terrei.y"
direction = point_direction(x, y, obv_vzriv.x - obj_beg_terrei.x, obv_vzriv.y - obj_beg_terrei.y);

/// @DnDAction : YoYo Games.Movement.Set_Speed
/// @DnDVersion : 1
/// @DnDHash : 17CF5CE3
/// @DnDApplyTo : {obj_beg_terrei}
/// @DnDArgument : "speed" "10"
with(obj_beg_terrei) speed = 10;

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 5C4FDF5C
/// @DnDArgument : "steps" "gamespeed_fps * 0.3"
alarm_set(0, gamespeed_fps * 0.3);
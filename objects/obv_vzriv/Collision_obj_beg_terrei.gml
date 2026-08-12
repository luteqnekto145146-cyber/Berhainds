/// @DnDAction : YoYo Games.Movement.Set_Direction_Point
/// @DnDVersion : 1
/// @DnDHash : 6F6892D3
/// @DnDArgument : "x" "obj_beg_terrei.x - x"
/// @DnDArgument : "y" "obj_beg_terrei.y - y"
direction = point_direction(x, y, obj_beg_terrei.x - x, obj_beg_terrei.y - y);

/// @DnDAction : YoYo Games.Movement.Add_Motion
/// @DnDVersion : 1
/// @DnDHash : 6E555278
/// @DnDApplyTo : {obj_beg_terrei}
/// @DnDArgument : "dir" "-direction"
/// @DnDArgument : "speed" " -0.25 * distance_to_object(obj_beg_terrei)"
with(obj_beg_terrei) motion_add(-direction,  -0.25 * distance_to_object(obj_beg_terrei));

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 5C4FDF5C
/// @DnDArgument : "steps" "room_speed * 0.3"
alarm_set(0, room_speed * 0.3);
/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2381FDD9
/// @DnDArgument : "code" " hdir = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) $(13_10)vdir = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) $(13_10)$(13_10)beg_cod();$(13_10)$(13_10)move_and_collide(hdir * move_speed, vdir * move_speed, obj_wall, 4, 0,0, move_speed, move_speed)"
 hdir = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) 
vdir = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) 

beg_cod();

move_and_collide(hdir * move_speed, vdir * move_speed, obj_wall, 4, 0,0, move_speed, move_speed)

/// @DnDAction : YoYo Games.Drawing.Draw_Instance_Health
/// @DnDVersion : 1
/// @DnDHash : 4705D189
/// @DnDArgument : "x1" "100"
/// @DnDArgument : "y1" "100"
/// @DnDArgument : "x2" "100"
/// @DnDArgument : "y2" "100"
/// @DnDArgument : "backcol" "$FF02FF3D"
/// @DnDArgument : "barcol" "$FF000000"
if(!variable_instance_exists(id, "__dnd_health")) __dnd_health = 0;draw_healthbar(100, 100, 100, 100, __dnd_health, $FF02FF3D, $FFFFFF & $FFFFFF, $FFFFFF & $FFFFFF, 0, (($FF02FF3D>>24) != 0), (($FF000000>>24) != 0));
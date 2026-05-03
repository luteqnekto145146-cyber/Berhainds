/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 6D5576C0
/// @DnDArgument : "code" " hdir = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) $(13_10)vdir = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) $(13_10)$(13_10)beg_cod();$(13_10)$(13_10)move_and_collide(hdir * move_speed, vdir * move_speed, obj_wall, 4, 0,0, move_speed, move_speed)"
 hdir = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) 
vdir = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) 

beg_cod();

move_and_collide(hdir * move_speed, vdir * move_speed, obj_wall, 4, 0,0, move_speed, move_speed)
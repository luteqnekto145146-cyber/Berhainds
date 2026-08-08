/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4B195B0B
/// @DnDInput : 2
/// @DnDArgument : "expr" "obj_beg_terrei.x"
/// @DnDArgument : "expr_1" "obj_beg_terrei.y"
/// @DnDArgument : "var" "x_player"
/// @DnDArgument : "var_1" "y_player"
x_player = obj_beg_terrei.x;
y_player = obj_beg_terrei.y;

/// @DnDAction : YoYo Games.Movement.Set_Direction_Point
/// @DnDVersion : 1
/// @DnDHash : 4400BD60
/// @DnDArgument : "x" "x_player"
/// @DnDArgument : "y" "y_player"
direction = point_direction(x, y, x_player, y_player);

/// @DnDAction : YoYo Games.Movement.Set_Speed
/// @DnDVersion : 1
/// @DnDHash : 1E9E32E5
/// @DnDArgument : "speed" "8"
speed = 8;
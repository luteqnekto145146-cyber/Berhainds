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
/// @DnDArgument : "speed" "1"
speed = 1;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 3070D00A
/// @DnDArgument : "var" "distance_to_object(obj_beg_terrei)"
/// @DnDArgument : "op" "3"
/// @DnDArgument : "value" "25"
if(distance_to_object(obj_beg_terrei) <= 25){	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0DED0F25
	/// @DnDParent : 3070D00A
	/// @DnDArgument : "var" "bomb_active"
	/// @DnDArgument : "value" "false"
	if(bomb_active == false){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 256D78BB
		/// @DnDParent : 0DED0F25
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "bomb_active"
		bomb_active = true;
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 44CBBCF6
		/// @DnDParent : 0DED0F25
		/// @DnDArgument : "spriteind" "schaz_bombanet"
		/// @DnDSaveInfo : "spriteind" "schaz_bombanet"
		sprite_index = schaz_bombanet;
		image_index = 0;
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 3AC82FBB
		/// @DnDParent : 0DED0F25
		/// @DnDArgument : "speed" "1 + distance_to_object(obj_beg_terrei)"
		image_speed = 1 + distance_to_object(obj_beg_terrei);
	
		/// @DnDAction : YoYo Games.Instances.Set_Alarm
		/// @DnDVersion : 1
		/// @DnDHash : 6E5A2C70
		/// @DnDParent : 0DED0F25
		/// @DnDArgument : "steps" "gamespeed_fps * 5"
		alarm_set(0, gamespeed_fps * 5);}}
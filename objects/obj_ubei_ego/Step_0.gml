/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
/// @DnDVersion : 1
/// @DnDHash : 1AF9F1E9
var l1AF9F1E9_0;l1AF9F1E9_0 = keyboard_check_pressed(vk_space);if (l1AF9F1E9_0){	/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
	/// @DnDVersion : 1.1
	/// @DnDHash : 50C52FE8
	/// @DnDParent : 1AF9F1E9
	/// @DnDArgument : "direction" "90"
	direction = 90;

	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 7B501F06
	/// @DnDParent : 1AF9F1E9
	/// @DnDArgument : "speed" "5"
	speed = 5;

	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 0B1A1CCB
	/// @DnDParent : 1AF9F1E9
	/// @DnDArgument : "speed" "3"
	/// @DnDArgument : "speed_relative" "1"
	/// @DnDArgument : "type" "1"
	hspeed += 3;}
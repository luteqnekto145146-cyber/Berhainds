/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 4D7500B5
/// @DnDArgument : "key" "ord("W")"
var l4D7500B5_0;l4D7500B5_0 = keyboard_check(ord("W"));if (l4D7500B5_0){	/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
	/// @DnDVersion : 1.1
	/// @DnDHash : 64086BBE
	/// @DnDParent : 4D7500B5
	/// @DnDArgument : "direction" "90"
	direction = 90;

	/// @DnDAction : YoYo Games.Movement.move_and_collide
	/// @DnDVersion : 1
	/// @DnDHash : 274DC244
	/// @DnDParent : 4D7500B5
	/// @DnDArgument : "yvel" "-1"
	/// @DnDArgument : "object" "beg_terrei"
	/// @DnDSaveInfo : "object" "beg_terrei"
	move_and_collide(0, -1, [beg_terrei],4,0,0,-1,-1);

	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 15078BE6
	/// @DnDParent : 4D7500B5
	/// @DnDArgument : "imageind_relative" "1"
	/// @DnDArgument : "spriteind" "beg_Terrei_zad"
	/// @DnDSaveInfo : "spriteind" "beg_Terrei_zad"
	sprite_index = beg_Terrei_zad;
	image_index += 0;

	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 00EC05EB
	/// @DnDParent : 4D7500B5
	image_speed = 1;}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 335D4AC3
else{	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
	/// @DnDVersion : 1
	/// @DnDHash : 48F18C8F
	/// @DnDParent : 335D4AC3
	/// @DnDArgument : "key" "ord("W")"
	/// @DnDArgument : "not" "1"
	var l48F18C8F_0;l48F18C8F_0 = keyboard_check(ord("W"));if (!l48F18C8F_0){	/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
		/// @DnDVersion : 1.1
		/// @DnDHash : 7D3A9EAE
		/// @DnDParent : 48F18C8F
		/// @DnDArgument : "direction" "90"
		direction = 90;
	
		/// @DnDAction : YoYo Games.Movement.move_and_collide
		/// @DnDVersion : 1
		/// @DnDHash : 26E19A2F
		/// @DnDParent : 48F18C8F
		/// @DnDArgument : "object" "beg_terrei"
		/// @DnDSaveInfo : "object" "beg_terrei"
		move_and_collide(0, 0, [beg_terrei],4,0,0,-1,-1);
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 52B3B5B7
		/// @DnDParent : 48F18C8F
		/// @DnDArgument : "speed" "0"
		image_speed = 0;}

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
	/// @DnDVersion : 1
	/// @DnDHash : 043299E8
	/// @DnDParent : 335D4AC3
	/// @DnDArgument : "key" "ord("A")"
	var l043299E8_0;l043299E8_0 = keyboard_check(ord("A"));if (l043299E8_0){	/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
		/// @DnDVersion : 1.1
		/// @DnDHash : 136060FC
		/// @DnDParent : 043299E8
		/// @DnDArgument : "direction" "180"
		direction = 180;
	
		/// @DnDAction : YoYo Games.Movement.move_and_collide
		/// @DnDVersion : 1
		/// @DnDHash : 65F5823E
		/// @DnDParent : 043299E8
		/// @DnDArgument : "xvel" "-1"
		/// @DnDArgument : "object" "beg_terrei"
		/// @DnDSaveInfo : "object" "beg_terrei"
		move_and_collide(-1, 0, [beg_terrei],4,0,0,-1,-1);
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 28FF7450
		/// @DnDParent : 043299E8
		/// @DnDArgument : "imageind_relative" "1"
		/// @DnDArgument : "spriteind" "ANM_Beg_TerrLEFT"
		/// @DnDSaveInfo : "spriteind" "ANM_Beg_TerrLEFT"
		sprite_index = ANM_Beg_TerrLEFT;
		image_index += 0;
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 7ED51B51
		/// @DnDParent : 043299E8
		image_speed = 1;}

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
	/// @DnDVersion : 1
	/// @DnDHash : 18F5A694
	/// @DnDParent : 335D4AC3
	/// @DnDArgument : "key" "ord("S")"
	var l18F5A694_0;l18F5A694_0 = keyboard_check(ord("S"));if (l18F5A694_0){	/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
		/// @DnDVersion : 1.1
		/// @DnDHash : 5B393740
		/// @DnDParent : 18F5A694
		/// @DnDArgument : "direction" "270"
		direction = 270;
	
		/// @DnDAction : YoYo Games.Movement.move_and_collide
		/// @DnDVersion : 1
		/// @DnDHash : 13E12619
		/// @DnDParent : 18F5A694
		/// @DnDArgument : "yvel" "1"
		/// @DnDArgument : "object" "beg_terrei"
		/// @DnDSaveInfo : "object" "beg_terrei"
		move_and_collide(0, 1, [beg_terrei],4,0,0,-1,-1);
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 51A52711
		/// @DnDParent : 18F5A694
		/// @DnDArgument : "imageind_relative" "1"
		/// @DnDArgument : "spriteind" "beg_terrei_pered"
		/// @DnDSaveInfo : "spriteind" "beg_terrei_pered"
		sprite_index = beg_terrei_pered;
		image_index += 0;
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 11E8F9C6
		/// @DnDParent : 18F5A694
		image_speed = 1;}

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
	/// @DnDVersion : 1
	/// @DnDHash : 0FA922D7
	/// @DnDParent : 335D4AC3
	/// @DnDArgument : "key" "ord("D")"
	var l0FA922D7_0;l0FA922D7_0 = keyboard_check(ord("D"));if (l0FA922D7_0){	/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
		/// @DnDVersion : 1.1
		/// @DnDHash : 5EFE2E40
		/// @DnDParent : 0FA922D7
		/// @DnDArgument : "direction" "0"
		direction = 0;
	
		/// @DnDAction : YoYo Games.Movement.move_and_collide
		/// @DnDVersion : 1
		/// @DnDHash : 5C2F9062
		/// @DnDParent : 0FA922D7
		/// @DnDArgument : "xvel" "1"
		/// @DnDArgument : "object" "beg_terrei"
		/// @DnDSaveInfo : "object" "beg_terrei"
		move_and_collide(1, 0, [beg_terrei],4,0,0,-1,-1);
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 1F45066C
		/// @DnDParent : 0FA922D7
		/// @DnDArgument : "imageind_relative" "1"
		/// @DnDArgument : "spriteind" "ANM_Beg_Terrei"
		/// @DnDSaveInfo : "spriteind" "ANM_Beg_Terrei"
		sprite_index = ANM_Beg_Terrei;
		image_index += 0;
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 38BE0DC3
		/// @DnDParent : 0FA922D7
		image_speed = 1;}}
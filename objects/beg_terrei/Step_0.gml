/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 07D256EF
/// @DnDArgument : "var" "sprite_index"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "terrei_brosok_suriken"
if(!(sprite_index == terrei_brosok_suriken)){	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
	/// @DnDVersion : 1
	/// @DnDHash : 4D7500B5
	/// @DnDParent : 07D256EF
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
		image_speed = 1;}}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 419D14D0
/// @DnDArgument : "var" "sprite_index"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "terrei_brosok_suriken"
if(!(sprite_index == terrei_brosok_suriken)){	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
	/// @DnDVersion : 1
	/// @DnDHash : 0FA922D7
	/// @DnDParent : 419D14D0
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

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 62C17635
/// @DnDArgument : "var" "sprite_index"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "terrei_brosok_suriken"
if(!(sprite_index == terrei_brosok_suriken)){	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
	/// @DnDVersion : 1
	/// @DnDHash : 18F5A694
	/// @DnDParent : 62C17635
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
		image_speed = 1;}}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 17E9C070
/// @DnDArgument : "var" "sprite_index"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "terrei_brosok_suriken"
if(!(sprite_index == terrei_brosok_suriken)){	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
	/// @DnDVersion : 1
	/// @DnDHash : 043299E8
	/// @DnDParent : 17E9C070
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
		image_speed = 1;}}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 29C5728A
/// @DnDArgument : "var" "sprite_index"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "terrei_brosok_suriken"
if(!(sprite_index == terrei_brosok_suriken)){	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Released
	/// @DnDVersion : 1
	/// @DnDHash : 04CFAE1E
	/// @DnDParent : 29C5728A
	/// @DnDArgument : "key" "ord("D")"
	var l04CFAE1E_0;l04CFAE1E_0 = keyboard_check_released(ord("D"));if (l04CFAE1E_0){	/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
		/// @DnDVersion : 1.1
		/// @DnDHash : 3ABC03D1
		/// @DnDParent : 04CFAE1E
		/// @DnDArgument : "direction" "0"
		direction = 0;
	
		/// @DnDAction : YoYo Games.Movement.move_and_collide
		/// @DnDVersion : 1
		/// @DnDHash : 788B5E85
		/// @DnDParent : 04CFAE1E
		/// @DnDArgument : "object" "beg_terrei"
		/// @DnDSaveInfo : "object" "beg_terrei"
		move_and_collide(0, 0, [beg_terrei],4,0,0,-1,-1);
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 44B59E28
		/// @DnDParent : 04CFAE1E
		/// @DnDArgument : "imageind_relative" "1"
		/// @DnDArgument : "spriteind" "ANM_Beg_Terrei"
		/// @DnDSaveInfo : "spriteind" "ANM_Beg_Terrei"
		sprite_index = ANM_Beg_Terrei;
		image_index += 0;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7DF0D6FD
		/// @DnDParent : 04CFAE1E
		/// @DnDArgument : "var" "image_index"
		image_index = 0;
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 59E2E42B
		/// @DnDParent : 04CFAE1E
		/// @DnDArgument : "speed" "0"
		image_speed = 0;}}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 23D0452F
/// @DnDArgument : "var" "sprite_index"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "terrei_brosok_suriken"
if(!(sprite_index == terrei_brosok_suriken)){	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Released
	/// @DnDVersion : 1
	/// @DnDHash : 5C01172F
	/// @DnDParent : 23D0452F
	/// @DnDArgument : "key" "ord("S")"
	var l5C01172F_0;l5C01172F_0 = keyboard_check_released(ord("S"));if (l5C01172F_0){	/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
		/// @DnDVersion : 1.1
		/// @DnDHash : 5947CDEB
		/// @DnDParent : 5C01172F
		/// @DnDArgument : "direction" "270"
		direction = 270;
	
		/// @DnDAction : YoYo Games.Movement.move_and_collide
		/// @DnDVersion : 1
		/// @DnDHash : 390C6284
		/// @DnDParent : 5C01172F
		/// @DnDArgument : "object" "beg_terrei"
		/// @DnDSaveInfo : "object" "beg_terrei"
		move_and_collide(0, 0, [beg_terrei],4,0,0,-1,-1);
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 668C4634
		/// @DnDParent : 5C01172F
		/// @DnDArgument : "imageind_relative" "1"
		/// @DnDArgument : "spriteind" "beg_terrei_pered"
		/// @DnDSaveInfo : "spriteind" "beg_terrei_pered"
		sprite_index = beg_terrei_pered;
		image_index += 0;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4A09617F
		/// @DnDParent : 5C01172F
		/// @DnDArgument : "var" "image_index"
		image_index = 0;
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 37A9E96B
		/// @DnDParent : 5C01172F
		/// @DnDArgument : "speed" "0"
		image_speed = 0;}}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5766901F
/// @DnDArgument : "var" "sprite_index"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "terrei_brosok_suriken"
if(!(sprite_index == terrei_brosok_suriken)){	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Released
	/// @DnDVersion : 1
	/// @DnDHash : 50683315
	/// @DnDParent : 5766901F
	/// @DnDArgument : "key" "ord("W")"
	var l50683315_0;l50683315_0 = keyboard_check_released(ord("W"));if (l50683315_0){	/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
		/// @DnDVersion : 1.1
		/// @DnDHash : 39504A59
		/// @DnDParent : 50683315
		/// @DnDArgument : "direction" "90"
		direction = 90;
	
		/// @DnDAction : YoYo Games.Movement.move_and_collide
		/// @DnDVersion : 1
		/// @DnDHash : 35349E60
		/// @DnDParent : 50683315
		/// @DnDArgument : "object" "beg_terrei"
		/// @DnDSaveInfo : "object" "beg_terrei"
		move_and_collide(0, 0, [beg_terrei],4,0,0,-1,-1);
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 12E9765B
		/// @DnDParent : 50683315
		/// @DnDArgument : "imageind_relative" "1"
		/// @DnDArgument : "spriteind" "beg_Terrei_zad"
		/// @DnDSaveInfo : "spriteind" "beg_Terrei_zad"
		sprite_index = beg_Terrei_zad;
		image_index += 0;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6A3A6D4B
		/// @DnDParent : 50683315
		/// @DnDArgument : "var" "image_index"
		image_index = 0;
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 5356A20C
		/// @DnDParent : 50683315
		/// @DnDArgument : "speed" "0"
		image_speed = 0;}}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 13485E8A
/// @DnDArgument : "var" "sprite_index"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "terrei_brosok_suriken"
if(!(sprite_index == terrei_brosok_suriken)){	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Released
	/// @DnDVersion : 1
	/// @DnDHash : 5ADFB213
	/// @DnDParent : 13485E8A
	/// @DnDArgument : "key" "ord("A")"
	var l5ADFB213_0;l5ADFB213_0 = keyboard_check_released(ord("A"));if (l5ADFB213_0){	/// @DnDAction : YoYo Games.Movement.Set_Direction_Fixed
		/// @DnDVersion : 1.1
		/// @DnDHash : 76F3D270
		/// @DnDParent : 5ADFB213
		/// @DnDArgument : "direction" "180"
		direction = 180;
	
		/// @DnDAction : YoYo Games.Movement.move_and_collide
		/// @DnDVersion : 1
		/// @DnDHash : 2B6EB2B7
		/// @DnDParent : 5ADFB213
		/// @DnDArgument : "object" "beg_terrei"
		/// @DnDSaveInfo : "object" "beg_terrei"
		move_and_collide(0, 0, [beg_terrei],4,0,0,-1,-1);
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 471F61C9
		/// @DnDParent : 5ADFB213
		/// @DnDArgument : "imageind_relative" "1"
		/// @DnDArgument : "spriteind" "ANM_Beg_TerrLEFT"
		/// @DnDSaveInfo : "spriteind" "ANM_Beg_TerrLEFT"
		sprite_index = ANM_Beg_TerrLEFT;
		image_index += 0;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 761ECBBF
		/// @DnDParent : 5ADFB213
		/// @DnDArgument : "var" "image_index"
		image_index = 0;
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 52CD05B4
		/// @DnDParent : 5ADFB213
		/// @DnDArgument : "speed" "0"
		image_speed = 0;}}
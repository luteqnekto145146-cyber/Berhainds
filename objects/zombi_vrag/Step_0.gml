/// @DnDAction : YoYo Games.Movement.Set_Direction_Point
/// @DnDVersion : 1
/// @DnDHash : 6B098025
/// @DnDArgument : "x" "obj_beg_terrei.x"
/// @DnDArgument : "y" "obj_beg_terrei.y"
direction = point_direction(x, y, obj_beg_terrei.x, obj_beg_terrei.y);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 797BBF9A
/// @DnDArgument : "var" "direction"
/// @DnDArgument : "value" "90"
if(direction == 90){	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 30133B0A
	/// @DnDParent : 797BBF9A
	/// @DnDArgument : "spriteind" "spr_idet_ot_nas_zombie"
	/// @DnDSaveInfo : "spriteind" "spr_idet_ot_nas_zombie"
	sprite_index = spr_idet_ot_nas_zombie;
	image_index = 0;

	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 6E03464E
	/// @DnDParent : 797BBF9A
	image_speed = 1;}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 28FF786F
else{	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 175ACE3E
	/// @DnDParent : 28FF786F
	/// @DnDArgument : "var" "direction"
	if(direction == 0){	/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 2315F3A3
		/// @DnDParent : 175ACE3E
		/// @DnDArgument : "spriteind" "spr_idet_v_pravo_zombie"
		/// @DnDSaveInfo : "spriteind" "spr_idet_v_pravo_zombie"
		sprite_index = spr_idet_v_pravo_zombie;
		image_index = 0;
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 38867EFC
		/// @DnDParent : 175ACE3E
		image_speed = 1;}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 74C5037C
	/// @DnDParent : 28FF786F
	else{	/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 16B07A7C
		/// @DnDParent : 74C5037C
		/// @DnDArgument : "var" "direction"
		/// @DnDArgument : "value" "180"
		if(direction == 180){	/// @DnDAction : YoYo Games.Instances.Set_Sprite
			/// @DnDVersion : 1
			/// @DnDHash : 0098CE80
			/// @DnDParent : 16B07A7C
			/// @DnDArgument : "spriteind" "spr_idet_v_levo_zombie"
			/// @DnDSaveInfo : "spriteind" "spr_idet_v_levo_zombie"
			sprite_index = spr_idet_v_levo_zombie;
			image_index = 0;
		
			/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
			/// @DnDVersion : 1
			/// @DnDHash : 3E670603
			/// @DnDParent : 16B07A7C
			image_speed = 1;}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 5A577007
		/// @DnDParent : 74C5037C
		else{	/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 47362565
			/// @DnDParent : 5A577007
			/// @DnDArgument : "var" "direction"
			/// @DnDArgument : "value" "270"
			if(direction == 270){	/// @DnDAction : YoYo Games.Instances.Set_Sprite
				/// @DnDVersion : 1
				/// @DnDHash : 38AF4915
				/// @DnDParent : 47362565
				/// @DnDArgument : "spriteind" "spr_idet_na_nas_zombie"
				/// @DnDSaveInfo : "spriteind" "spr_idet_na_nas_zombie"
				sprite_index = spr_idet_na_nas_zombie;
				image_index = 0;
			
				/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
				/// @DnDVersion : 1
				/// @DnDHash : 0CFE0732
				/// @DnDParent : 47362565
				image_speed = 1;}}}}

/// @DnDAction : YoYo Games.Movement.move_and_collide
/// @DnDVersion : 1
/// @DnDHash : 71D090B8
/// @DnDArgument : "xvel" "(obj_beg_terrei.x - zombi_vrag.x)"
/// @DnDArgument : "yvel" "(obj_beg_terrei.y - zombi_vrag.y) - 25"
/// @DnDArgument : "maxxmove" "1"
/// @DnDArgument : "maxymove" "1"
/// @DnDArgument : "object" "zombi_vrag"
/// @DnDSaveInfo : "object" "zombi_vrag"
move_and_collide((obj_beg_terrei.x - zombi_vrag.x), (obj_beg_terrei.y - zombi_vrag.y) - 25, [zombi_vrag],4,0,0,1,1);
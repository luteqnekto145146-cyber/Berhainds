/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 4788DA78
/// @DnDArgument : "expr" "can_shoot"
if(can_shoot){	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 3E1610EA
	/// @DnDParent : 4788DA78
	/// @DnDArgument : "spriteind" "terrei_brosok_suriken"
	sprite_index = terrei_brosok_suriken;
	image_index = 0;

	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 47E6C192
	/// @DnDParent : 4788DA78
	image_speed = 1;

	/// @DnDAction : YoYo Games.Movement.move_and_collide
	/// @DnDVersion : 1
	/// @DnDHash : 78E1DEDC
	/// @DnDParent : 4788DA78
	/// @DnDArgument : "object" "beg_terrei"
	/// @DnDSaveInfo : "object" "beg_terrei"
	move_and_collide(0, 0, [beg_terrei],4,0,0,-1,-1);

	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 25B44F98
	/// @DnDParent : 4788DA78
	/// @DnDArgument : "xpos" "0+(20*image_xscale)"
	/// @DnDArgument : "xpos_relative" "1"
	/// @DnDArgument : "ypos" "0-10"
	/// @DnDArgument : "ypos_relative" "1"
	/// @DnDArgument : "var" "new_shur"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "sapfir_"
	var new_shur = instance_create_layer(x + 0+(20*image_xscale), y + 0-10, "Instances", sapfir_);

	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 5E486719
	/// @DnDParent : 4788DA78
	/// @DnDArgument : "spriteind" "spr_terrei_brosok_suriken"
	/// @DnDSaveInfo : "spriteind" "spr_terrei_brosok_suriken"
	sprite_index = spr_terrei_brosok_suriken;
	image_index = 0;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 516B0DCA
	/// @DnDApplyTo : sapfir_
	/// @DnDParent : 4788DA78
	/// @DnDArgument : "expr" "10"
	/// @DnDArgument : "var" "new_shur.speed"
	with(sapfir_) {
	new_shur.speed = 10;
	
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 36451A64
	/// @DnDParent : 4788DA78
	/// @DnDArgument : "expr" "false"
	/// @DnDArgument : "var" "can_shoot"
	can_shoot = false;

	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 3C66093E
	/// @DnDParent : 4788DA78
	/// @DnDArgument : "steps" "gamespeed_fps * 2"
	/// @DnDArgument : "alarm" "1"
	alarm_set(1, gamespeed_fps * 2);

	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 38E6A3D0
	/// @DnDParent : 4788DA78
	/// @DnDArgument : "steps" "gamespeed_fps * 1"
	alarm_set(0, gamespeed_fps * 1);}
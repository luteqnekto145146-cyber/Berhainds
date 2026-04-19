/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5ECA4CB8
/// @DnDArgument : "var" "can_shoot"
/// @DnDArgument : "value" "true"
if(can_shoot == true){	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 276B8ED6
	/// @DnDParent : 5ECA4CB8
	/// @DnDArgument : "spriteind" "terrei_brosok_suriken"
	/// @DnDSaveInfo : "spriteind" "terrei_brosok_suriken"
	sprite_index = spr_terrei_brosok_suriken;
	image_index = 0;

	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 5A5F184A
	/// @DnDParent : 5ECA4CB8
	image_speed = 1;

	/// @DnDAction : YoYo Games.Movement.move_and_collide
	/// @DnDVersion : 1
	/// @DnDHash : 2EB832AD
	/// @DnDParent : 5ECA4CB8
	/// @DnDArgument : "object" "beg_terrei"
	/// @DnDSaveInfo : "object" "beg_terrei"
	move_and_collide(0, 0, [obj_beg_terrei],4,0,0,-1,-1);

	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 7382F6B5
	/// @DnDParent : 5ECA4CB8
	/// @DnDArgument : "xpos" "0+(20*image_xscale)"
	/// @DnDArgument : "xpos_relative" "1"
	/// @DnDArgument : "ypos" "0-10"
	/// @DnDArgument : "ypos_relative" "1"
	/// @DnDArgument : "var" "new_shur"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "sapfir_"
	/// @DnDSaveInfo : "objectid" "sapfir_"
	var new_shur = instance_create_layer(x + 0+(20*image_xscale), y + 0-10, "Instances", obj_sapfir_suriken);

	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 2910D28E
	/// @DnDParent : 5ECA4CB8
	/// @DnDArgument : "spriteind" "terrei_brosok_suriken"
	/// @DnDSaveInfo : "spriteind" "terrei_brosok_suriken"
	sprite_index = spr_terrei_brosok_suriken;
	image_index = 0;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2F3D3A93
	/// @DnDApplyTo : {sapfir_}
	/// @DnDParent : 5ECA4CB8
	/// @DnDArgument : "expr" "10"
	/// @DnDArgument : "var" "new_shur.speed"
	with(obj_sapfir_suriken) {
	new_shur.speed = 10;
	
	}}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 78E6F654
/// @DnDApplyTo : {sapfir_}
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "canwalk"
with(obj_sapfir_suriken) {
canwalk = false;

}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 274B9481
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "can_shoot"
can_shoot = false;

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 3ADB267D
/// @DnDArgument : "steps" "gamespeed_fps * 1"
alarm_set(0, gamespeed_fps * 1);

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 3341BB56
/// @DnDArgument : "steps" "gamespeed_fps * 2"
/// @DnDArgument : "alarm" "1"
alarm_set(1, gamespeed_fps * 2);
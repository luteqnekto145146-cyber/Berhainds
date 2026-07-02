/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 24003091
/// @DnDArgument : "code" "active = true$(13_10)"
active = true

/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 327C7A26
/// @DnDArgument : "obj" "obj_tun_Screamin"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "obj" "obj_tun_Screamin"
var l327C7A26_0 = false;l327C7A26_0 = instance_exists(obj_tun_Screamin);if(!l327C7A26_0){	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 6FE726CF
	/// @DnDParent : 327C7A26
	/// @DnDArgument : "objectid" "obj_tun_Screamin"
	/// @DnDArgument : "layer" ""Instances_1""
	/// @DnDSaveInfo : "objectid" "obj_tun_Screamin"
	instance_create_layer(0, 0, "Instances_1", obj_tun_Screamin);

	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 3B9D7C99
	/// @DnDApplyTo : {obj_tun_chest}
	/// @DnDParent : 327C7A26
	/// @DnDArgument : "imageind" "1"
	/// @DnDArgument : "spriteind" "spr_tun_chest"
	/// @DnDSaveInfo : "spriteind" "spr_tun_chest"
	with(obj_tun_chest) {
	sprite_index = spr_tun_chest;
	image_index = 1;
	}

	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 3E3282DA
	/// @DnDParent : 327C7A26
	/// @DnDArgument : "speed" "0"
	image_speed = 0;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7033E451
	/// @DnDParent : 327C7A26
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "tun"
	tun = true;

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 015E02D1
	/// @DnDParent : 327C7A26
	/// @DnDArgument : "soundid" "snd_angel_ttt_sahur"
	/// @DnDArgument : "loop" "1"
	/// @DnDSaveInfo : "soundid" "snd_angel_ttt_sahur"
	audio_play_sound(snd_angel_ttt_sahur, 0, 1, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 33C96044
	/// @DnDParent : 327C7A26
	/// @DnDArgument : "expr" "false"
	/// @DnDArgument : "var" "tun"
	tun = false;}
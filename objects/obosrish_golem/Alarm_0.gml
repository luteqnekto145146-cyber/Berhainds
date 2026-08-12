/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 50ADDFB4
/// @DnDArgument : "soundid" "untitle2d"
/// @DnDSaveInfo : "soundid" "untitle2d"
audio_play_sound(untitle2d, 0, 0, 1.0, undefined, 1.0);

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 71E4469C
/// @DnDArgument : "xpos_relative" "1"
/// @DnDArgument : "ypos_relative" "1"
/// @DnDArgument : "objectid" "obv_vzriv"
/// @DnDSaveInfo : "objectid" "obv_vzriv"
instance_create_layer(x + 0, y + 0, "Instances", obv_vzriv);

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 13983474
instance_destroy();
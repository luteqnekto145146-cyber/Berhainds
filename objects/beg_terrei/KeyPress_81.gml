/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5E89CD4C
/// @DnDArgument : "var" "has_fired"
has_fired = 0;

/// @DnDAction : YoYo Games.Instances.Set_Sprite
/// @DnDVersion : 1
/// @DnDHash : 4CE7F59B
/// @DnDArgument : "spriteind" "terrei_brosok_suriken"
/// @DnDSaveInfo : "spriteind" "terrei_brosok_suriken"
sprite_index = terrei_brosok_suriken;
image_index = 0;

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 13BA9B80
/// @DnDArgument : "xpos_relative" "1"
/// @DnDArgument : "ypos" "10"
/// @DnDArgument : "ypos_relative" "1"
/// @DnDArgument : "var" "my_shuriken"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "objectid" "sapfir_"
/// @DnDSaveInfo : "objectid" "sapfir_"
var my_shuriken = instance_create_layer(x + 0, y + 10, "Instances", sapfir_);

/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
/// @DnDVersion : 1
/// @DnDHash : 33C4EEA1
/// @DnDApplyTo : my_shuriken
/// @DnDArgument : "value" "image_xscale*10"
/// @DnDArgument : "instvar" "4"
with(my_shuriken) {
hspeed = image_xscale*10;
}
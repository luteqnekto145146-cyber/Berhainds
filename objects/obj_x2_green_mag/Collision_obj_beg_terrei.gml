/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 7EFE427C
/// @DnDApplyTo : {obj_zombie}
/// @DnDArgument : "xpos" "x"
/// @DnDArgument : "ypos" "y"
/// @DnDArgument : "var" "green_mags = 1"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "objectid" "obj_green_mag"
/// @DnDSaveInfo : "objectid" "obj_green_mag"
with(obj_zombie) {
	var green_mags = 1 = instance_create_layer(x, y, "Instances", obj_green_mag); 
}

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 5E56F050
instance_destroy();
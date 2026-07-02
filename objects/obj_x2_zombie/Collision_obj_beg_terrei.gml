/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 281F9E48
/// @DnDApplyTo : {obj_zombie}
/// @DnDArgument : "xpos" "x"
/// @DnDArgument : "ypos" "y"
/// @DnDArgument : "var" "zombie = 1"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "objectid" "obj_zombie"
/// @DnDSaveInfo : "objectid" "obj_zombie"
with(obj_zombie) {
	var zombie = 1 = instance_create_layer(x, y, "Instances", obj_zombie); 
}

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 51F29704
instance_destroy();
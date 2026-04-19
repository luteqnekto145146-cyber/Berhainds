/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 24003091
/// @DnDArgument : "code" "active = true$(13_10)"
active = true

/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 72F9C02B
/// @DnDArgument : "obj" "Object16"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "obj" "Object16"
var l72F9C02B_0 = false;l72F9C02B_0 = instance_exists(Object16);if(!l72F9C02B_0){	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 5C877360
	/// @DnDParent : 72F9C02B
	/// @DnDArgument : "xpos" "x"
	/// @DnDArgument : "ypos" "y - 60"
	/// @DnDArgument : "objectid" "Object16"
	/// @DnDSaveInfo : "objectid" "Object16"
	instance_create_layer(x, y - 60, "Instances", Object16);}
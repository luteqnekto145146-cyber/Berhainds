/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 6F33445D
/// @DnDArgument : "code" "if(distance_to_object(beg_terrei) > 34)$(13_10){$(13_10)	active = false;$(13_10)}"
if(distance_to_object(obj_beg_terrei) > 34)
{
	active = false;
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0B840F2B
/// @DnDArgument : "var" "distance_to_object(beg_terrei)"
/// @DnDArgument : "op" "2"
/// @DnDArgument : "value" "30"
if(distance_to_object(obj_beg_terrei) > 30){	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 2F78C272
	/// @DnDApplyTo : {Object16}
	/// @DnDParent : 0B840F2B
	with(Object16) instance_destroy();}
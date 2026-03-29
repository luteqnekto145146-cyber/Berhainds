/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0E8684F3
/// @DnDArgument : "var" "sprite_index"
/// @DnDArgument : "value" "terrei_brosok_suriken"
if(sprite_index == terrei_brosok_suriken){	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 286225EC
	/// @DnDParent : 0E8684F3
	/// @DnDArgument : "var" "floor(image_index)"
	/// @DnDArgument : "value" "4"
	if(floor(image_index) == 4){	/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5DE96824
		/// @DnDParent : 286225EC
		/// @DnDArgument : "var" "can_shoot"
		/// @DnDArgument : "value" "true"
		if(can_shoot == true){	/// @DnDAction : YoYo Games.Instances.Create_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 42610095
			/// @DnDParent : 5DE96824
			/// @DnDArgument : "xpos" "0+(20*image_xscale)"
			/// @DnDArgument : "xpos_relative" "1"
			/// @DnDArgument : "ypos" "0-10"
			/// @DnDArgument : "ypos_relative" "1"
			/// @DnDArgument : "var" "new_shur"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "objectid" "sapfir_"
			/// @DnDSaveInfo : "objectid" "sapfir_"
			var new_shur = instance_create_layer(x + 0+(20*image_xscale), y + 0-10, "Instances", sapfir_);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 18295A32
			/// @DnDParent : 5DE96824
			/// @DnDArgument : "expr" "false"
			/// @DnDArgument : "var" "can_shoot"
			can_shoot = false;
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6EFE9742
			/// @DnDApplyTo : {sapfir_}
			/// @DnDParent : 5DE96824
			/// @DnDArgument : "expr" "10"
			/// @DnDArgument : "var" "new_shur.speed"
			with(sapfir_) {
			new_shur.speed = 10;
			
			}}}}
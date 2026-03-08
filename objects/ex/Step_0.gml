/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 6030B280
/// @DnDArgument : "expr" "position_meeting(mouse_x, mouse_y, id)"
if(position_meeting(mouse_x, mouse_y, id)){	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0E58E9E1
	/// @DnDParent : 6030B280
	/// @DnDArgument : "expr" "base_scale * 1.1"
	/// @DnDArgument : "var" "target_scale"
	target_scale = base_scale * 1.1;}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 2661D23E
else{	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 53764BB8
	/// @DnDParent : 2661D23E
	/// @DnDArgument : "expr" "base_scale"
	/// @DnDArgument : "var" "target_scale"
	target_scale = base_scale;}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 4CEAE448
/// @DnDArgument : "expr" "image_xscale < target_scale - 0.01"
if(image_xscale < target_scale - 0.01){	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 66014E22
	/// @DnDParent : 4CEAE448
	/// @DnDArgument : "expr" " image_xscale + scale_speed"
	/// @DnDArgument : "var" "image_xscale"
	image_xscale =  image_xscale + scale_speed;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7674EB55
	/// @DnDParent : 4CEAE448
	/// @DnDArgument : "expr" "image_yscale + scale_speed"
	/// @DnDArgument : "var" "image_yscale"
	image_yscale = image_yscale + scale_speed;}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 35C8D1C0
else{	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 5ABBDA8C
	/// @DnDParent : 35C8D1C0
	/// @DnDArgument : "expr" "image_xscale > target_scale + 0.01"
	if(image_xscale > target_scale + 0.01){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 70CB9104
		/// @DnDParent : 5ABBDA8C
		/// @DnDArgument : "expr" "image_xscale - scale_speed"
		/// @DnDArgument : "var" "image_xscale"
		image_xscale = image_xscale - scale_speed;}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 3B9038FF
	/// @DnDParent : 35C8D1C0
	/// @DnDArgument : "expr" "image_yscale > target_scale + 0.01"
	if(image_yscale > target_scale + 0.01){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 589C890A
		/// @DnDParent : 3B9038FF
		/// @DnDArgument : "expr" "image_yscale - scale_speed"
		/// @DnDArgument : "var" "image_yscale"
		image_yscale = image_yscale - scale_speed;}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 51F2DDBB
	/// @DnDParent : 35C8D1C0
	/// @DnDArgument : "expr" "abs(image_xscale - target_scale) <= 0.01"
	if(abs(image_xscale - target_scale) <= 0.01){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 40586D9E
		/// @DnDParent : 51F2DDBB
		/// @DnDArgument : "expr" "image_xscale = target_scale image_yscale = target_scale"
		/// @DnDArgument : "var" "target_scale"
		target_scale = image_xscale = target_scale image_yscale = target_scale;}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 024EBB56
	/// @DnDParent : 35C8D1C0
	/// @DnDArgument : "expr" "abs(image_xscale - 1) < 0.02"
	if(abs(image_xscale - 1) < 0.02){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 514FC4B5
		/// @DnDParent : 024EBB56
		/// @DnDArgument : "expr" "clamp(image_xscale, base_scale, base_scale * 1.1)"
		/// @DnDArgument : "var" "image_xscale"
		image_xscale = clamp(image_xscale, base_scale, base_scale * 1.1);}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 54F7A57F
	/// @DnDParent : 35C8D1C0
	/// @DnDArgument : "expr" "abs(image_yscale - 1) < 0.02"
	if(abs(image_yscale - 1) < 0.02){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3AA52DBD
		/// @DnDParent : 54F7A57F
		/// @DnDArgument : "expr" "clamp(image_yscale, base_scale, base_scale * 1.1)"
		/// @DnDArgument : "var" "image_yscale"
		image_yscale = clamp(image_yscale, base_scale, base_scale * 1.1);}}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 50A6DB93
/// @DnDArgument : "expr" "abs(image_xscale - target_scale) < 0.02"
if(abs(image_xscale - target_scale) < 0.02){	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2E9FB2AC
	/// @DnDParent : 50A6DB93
	/// @DnDArgument : "expr" "target_scale"
	/// @DnDArgument : "var" "image_xscale"
	image_xscale = target_scale;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 11FA25E7
	/// @DnDParent : 50A6DB93
	/// @DnDArgument : "expr" "target_scale"
	/// @DnDArgument : "var" "image_yscale"
	image_yscale = target_scale;}
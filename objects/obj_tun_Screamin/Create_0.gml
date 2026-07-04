/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
/// @DnDVersion : 1
/// @DnDHash : 77BC6F69
/// @DnDArgument : "alpha" "10000"
image_alpha = 10000;

/// @DnDAction : YoYo Games.Instances.Sprite_Scale
/// @DnDVersion : 1
/// @DnDHash : 77E73BB2
/// @DnDArgument : "xscale" "room_width/sprite_get_width(spr_screamin_tun)"
/// @DnDArgument : "yscale" "room_height/sprite_get_height(spr_screamin_tun)"
image_xscale = room_width/sprite_get_width(spr_screamin_tun);image_yscale = room_height/sprite_get_height(spr_screamin_tun);

/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
/// @DnDVersion : 1
/// @DnDHash : 1B30D084
image_speed = 1;
/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
/// @DnDVersion : 1
/// @DnDHash : 6ECBAF08
/// @DnDArgument : "xscale" "display_get_width() / sprite_get_width(Sprite13)"
/// @DnDArgument : "yscale" "display_get_height() / sprite_get_height(Sprite13)"
/// @DnDArgument : "sprite" "Sprite20"
/// @DnDArgument : "frame" "image_index"
/// @DnDSaveInfo : "sprite" "Sprite20"
draw_sprite_ext(Sprite20, image_index, 0, 0, display_get_width() / sprite_get_width(Sprite13), display_get_height() / sprite_get_height(Sprite13), 0, $FFFFFF & $ffffff, 1);

/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
/// @DnDVersion : 1
/// @DnDHash : 078AB9BC
image_speed = 1;
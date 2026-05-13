/// @DnDAction : YoYo Games.Drawing.Draw_Instance_Health
/// @DnDVersion : 1
/// @DnDHash : 624E2733
/// @DnDArgument : "x1" "50"
/// @DnDArgument : "y1" "65"
/// @DnDArgument : "x2" "250"
/// @DnDArgument : "y2" "75"
/// @DnDArgument : "direction" "1"
/// @DnDArgument : "backcol" "$FF494949"
/// @DnDArgument : "barcol" "$FF000000"
/// @DnDArgument : "mincol" "$FF0000FF"
/// @DnDArgument : "maxcol" "$FF0AFF26"
if(!variable_instance_exists(id, "__dnd_health")) __dnd_health = 0;draw_healthbar(50, 65, 250, 75, __dnd_health, $FF494949, $FF0000FF & $FFFFFF, $FF0AFF26 & $FFFFFF, 1, (($FF494949>>24) != 0), (($FF000000>>24) != 0));
/// @DnDAction : YoYo Games.Files.If_File_Exists
/// @DnDVersion : 1
/// @DnDHash : 1990DBD8
/// @DnDArgument : "file" ""save.dat""
var l1990DBD8_0 = file_exists("save.dat");if(l1990DBD8_0){	/// @DnDAction : YoYo Games.Game.Load_Game
	/// @DnDVersion : 1
	/// @DnDHash : 7AE580C3
	/// @DnDParent : 1990DBD8
	game_load("save.dat");

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 6614092F
	/// @DnDParent : 1990DBD8
	instance_destroy();}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 6369B142
else{	/// @DnDAction : YoYo Games.Rooms.Next_Room
	/// @DnDVersion : 1
	/// @DnDHash : 35C7BE88
	/// @DnDParent : 6369B142
	room_goto_next();

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 31F8DB9D
	/// @DnDParent : 6369B142
	instance_destroy();}
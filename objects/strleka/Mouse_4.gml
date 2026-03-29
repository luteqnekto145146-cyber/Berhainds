/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 25EB59E9
/// @DnDApplyTo : {strleka}
with(strleka) {
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 48B06A19
	/// @DnDApplyTo : other
	/// @DnDParent : 25EB59E9
	with(other) instance_destroy();

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 15846680
	/// @DnDParent : 25EB59E9
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 6B51CC34
		/// @DnDApplyTo : other
		/// @DnDParent : 15846680
		with(other) instance_destroy();
	
		/// @DnDAction : YoYo Games.Rooms.Go_To_Room
		/// @DnDVersion : 1
		/// @DnDHash : 6F7A5938
		/// @DnDParent : 15846680
		/// @DnDArgument : "room" "menu_i"
		/// @DnDSaveInfo : "room" "menu_i"
		room_goto(menu_i);
}
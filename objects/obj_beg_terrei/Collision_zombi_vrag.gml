/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 27E23110
/// @DnDArgument : "var" "canknock"
/// @DnDArgument : "value" "true"
if(canknock == true){	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 534D7630
	/// @DnDParent : 27E23110
	/// @DnDArgument : "steps" "room_speed * 0.5"
	alarm_set(0, room_speed * 0.5);

	/// @DnDAction : YoYo Games.Instance Variables.Get_Health
	/// @DnDVersion : 1
	/// @DnDHash : 2CB404C2
	/// @DnDParent : 27E23110
	/// @DnDArgument : "var" "healt"
	if(!variable_instance_exists(id, "__dnd_health")) __dnd_health = 0;healt = __dnd_health;

	/// @DnDAction : YoYo Games.Instance Variables.Set_Health
	/// @DnDVersion : 1
	/// @DnDHash : 0FDA8701
	/// @DnDParent : 27E23110
	/// @DnDArgument : "health" "healt - 20"
	__dnd_health = real(healt - 20);

	/// @DnDAction : YoYo Games.Movement.Add_Motion
	/// @DnDVersion : 1
	/// @DnDHash : 7118CA7C
	/// @DnDParent : 27E23110
	/// @DnDArgument : "dir" "randomise()"
	/// @DnDArgument : "speed" "3"
	motion_add(randomise(), 3);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6944F47C
	/// @DnDParent : 27E23110
	/// @DnDArgument : "expr" "false "
	/// @DnDArgument : "var" "canknock"
	canknock = false ;}
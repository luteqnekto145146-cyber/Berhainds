var l4D7500B5_0;
l4D7500B5_0 = keyboard_check(ord("W"));
if (l4D7500B5_0)
{
	if(canwalk == true)
{
	direction = 90;
	
		move_and_collide(0, -1, [beg_terrei],4,0,0,-1,-1);
	
		sprite_index = beg_Terrei_zad;
		image_index += 0;
	
		image_speed = 1;
}
}

var l0FA922D7_0;
l0FA922D7_0 = keyboard_check(ord("D"));
if (l0FA922D7_0)
{
	if(canwalk == true)
{
	direction = 0;
	
		move_and_collide(1, 0, [beg_terrei],4,0,0,-1,-1);
	
		sprite_index = ANM_Beg_Terrei;
		image_index += 0;
		image_speed = 1;
}
}

var l18F5A694_0;
l18F5A694_0 = keyboard_check(ord("S"));
if (l18F5A694_0)
{
	if(canwalk == true)
{
	direction = 270;
		move_and_collide(0, 1, [beg_terrei],4,0,0,-1,-1);
	
		sprite_index = beg_terrei_pered;
		image_index += 0;
	
		image_speed = 1;
}
}
var l043299E8_0;
l043299E8_0 = keyboard_check(ord("A"));
if (l043299E8_0)
{
	if(canwalk == true)
{
	direction = 180;
		move_and_collide(-1, 0, [beg_terrei],4,0,0,-1,-1);
		sprite_index = ANM_Beg_TerrLEFT;
		image_index += 0;
		image_speed = 1;
}
}
var l04CFAE1E_0;
l04CFAE1E_0 = keyboard_check_released(ord("D"));
if (l04CFAE1E_0)
{
	direction = 0;
	move_and_collide(0, 0, [beg_terrei],4,0,0,-1,-1);
	sprite_index = ANM_Beg_Terrei;
	image_index += 0;
	image_index = 0;
	image_speed = 0;
}
var l5C01172F_0;
l5C01172F_0 = keyboard_check_released(ord("S"));
if (l5C01172F_0)
{
	direction = 270;
	move_and_collide(0, 0, [beg_terrei],4,0,0,-1,-1);
	sprite_index = beg_terrei_pered;
	image_index += 0;
	image_index = 0;
	image_speed = 0;
}
var l50683315_0;
l50683315_0 = keyboard_check_released(ord("W"));
if (l50683315_0)
{
	direction = 90;
	move_and_collide(0, 0, [beg_terrei],4,0,0,-1,-1);
	sprite_index = beg_Terrei_zad;
	image_index += 0;
	image_index = 0;
	image_speed = 0;
}
var l5ADFB213_0;
l5ADFB213_0 = keyboard_check_released(ord("A"));
if (l5ADFB213_0)
{
	direction = 180;
	move_and_collide(0, 0, [beg_terrei],4,0,0,-1,-1);
	sprite_index = ANM_Beg_TerrLEFT;
	image_index += 0;
	image_index = 0;
	image_speed = 0;
}
/// @description Insert description here
// You can write your code in this editor

with obj_player_minigame
{
	other.x = x;
	other.y =y;
}

if global.in_jump_meter
{
	visible = true;
}
else
{
	visible = false;
}

//maps 0-100 to 0--0.9
//image_angle = global.percent_held * (0.9);
image_angle = 45 + ((global.percent_held/2)*90);
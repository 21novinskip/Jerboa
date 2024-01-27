if instance_exists(obj_player_overworld)
{
	var _px = obj_player_overworld.x;
	var _py = obj_player_overworld.y;
	player_angle = point_direction(x,y,_px,_py);
}
if player_angle >= 225 and player_angle < 315
{
	sprite_index = spr_rabbit_front_strip2;
}
else if player_angle >= 315 or (player_angle >= 0 and player_angle < 45)
{
	sprite_index = spr_rabbit_right_strip2;
}
if player_angle >= 45 and player_angle < 135
{
	sprite_index = spr_rabbit_back_strip2;
}
if player_angle >= 135 and player_angle < 225
{
	sprite_index = spr_rabbit_left_strip2;
}
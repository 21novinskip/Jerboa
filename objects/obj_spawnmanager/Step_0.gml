if global.race_done == true
{
	global.playerspawn_x = global.player_respawn_x;
	global.playerspawn_y = global.playe_respawn_y;
}
else if global.race_done == false
{
	global.playerspawn_x = 140;
	global.playerspawn_y = 787;
}
if room != rm_room3 and !instance_exists(obj_player_overworld)
{
	instance_create_layer(global.playerspawn_x, global.playerspawn_y, "Instances", obj_player_overworld)
}
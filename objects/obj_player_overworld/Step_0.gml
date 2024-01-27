//Overworld movement
if (keyboard_check(vk_right))
{
	x += 4;
	sprite_index = spr_jerboa_right_strip2;
}
if (keyboard_check(vk_left))
{
	x -= 4;
	sprite_index = spr_jerboa_left_strip2;
}
if (keyboard_check(vk_up))
{
	y -= 4;
	sprite_index = spr_jerboa_back_strip2;
}
if (keyboard_check(vk_down))
{
	y += 4;
	sprite_index = spr_jerboa_front_strip2;
}


//COLLISION CHECK WALL
	//RIGHT
	if tilemap_get_at_pixel(global.map,bbox_right+4,bbox_bottom) == COLLISION_TILES.WALL or tilemap_get_at_pixel(global.map,bbox_right+4*1,bbox_top) == COLLISION_TILES.WALL or tilemap_get_at_pixel(global.map,bbox_right+4*1,(bbox_bottom+bbox_top)/2) == COLLISION_TILES.WALL
	{
		speed = 0;
		while tilemap_get_at_pixel(global.map,bbox_right+4,(bbox_bottom+bbox_top)/2) == COLLISION_TILES.WALL
		{
			x-=1;
		}
		while tilemap_get_at_pixel(global.map,bbox_right+4,bbox_bottom) == COLLISION_TILES.WALL
		{
			y-=1;
		}
		while tilemap_get_at_pixel(global.map,bbox_right+4,bbox_top) == COLLISION_TILES.WALL
		{
			y+=1;
		}
		repeat (5)
		{
		}
		//global.playerstate = 0;
	}
	//LEFT
	if tilemap_get_at_pixel(global.map,bbox_left+4,bbox_bottom) == COLLISION_TILES.WALL or tilemap_get_at_pixel(global.map,bbox_left+4*1,bbox_top) == COLLISION_TILES.WALL or tilemap_get_at_pixel(global.map,bbox_left+4*1,(bbox_bottom+bbox_top)/2) == COLLISION_TILES.WALL
	{
		speed = 0
		while tilemap_get_at_pixel(global.map,bbox_left+4,(bbox_bottom+bbox_top)/2) == COLLISION_TILES.WALL
		{
			x+=1
		}
		while tilemap_get_at_pixel(global.map,bbox_left+4,bbox_bottom) == COLLISION_TILES.WALL
		{
			y-=1
		}
		while tilemap_get_at_pixel(global.map,bbox_left+4,bbox_top) == COLLISION_TILES.WALL
		{
			y+=1
		}		
		repeat (5)
		{
		}
		//global.playerstate = 0;
	}
	//DOWN
	if tilemap_get_at_pixel(global.map,bbox_left+4,bbox_bottom) == COLLISION_TILES.WALL or tilemap_get_at_pixel(global.map,bbox_right+4*1,bbox_bottom) == COLLISION_TILES.WALL or tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2+4*1,bbox_bottom) == COLLISION_TILES.WALL
	{
		speed = 0;
		//ENEMYcount = 15;
		while tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2+4,bbox_bottom) == COLLISION_TILES.WALL
		{
			y-=1
		}
		repeat (5)
		{
		}
		//global.playerstate = 0;
	}
	//UP
	if tilemap_get_at_pixel(global.map,bbox_left+4*1,bbox_top) == COLLISION_TILES.WALL or tilemap_get_at_pixel(global.map,bbox_right+4*1,bbox_top) == COLLISION_TILES.WALL or tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2+4*1,bbox_top) == COLLISION_TILES.WALL
	{
		speed = 0;
		//ENEMYcount = 15;
		while tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2+4*1,bbox_top) == COLLISION_TILES.WALL
		{
			y+=1;
		}
		repeat (5)
		{
		}		
		//global.playerstate = 0;
	}
//nEXT ROOM

if room == rm_room1
{
	if tilemap_get_at_pixel(global.map,bbox_right+4,bbox_bottom) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,bbox_right+4*1,bbox_top) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,bbox_right+4*1,(bbox_bottom+bbox_top)/2) == COLLISION_TILES.DOOR
		{
			room_goto(rm_room2);
		}
		if tilemap_get_at_pixel(global.map,bbox_left+4,bbox_bottom) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,bbox_left+4*1,bbox_top) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,bbox_left+4*1,(bbox_bottom+bbox_top)/2) == COLLISION_TILES.DOOR
		{
			room_goto(rm_room2);
		}
		//DOWN
		if tilemap_get_at_pixel(global.map,bbox_left+4,bbox_bottom) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,bbox_right+4*1,bbox_bottom) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2+4*1,bbox_bottom) == COLLISION_TILES.DOOR
		{
			room_goto(rm_room2);
		}
		//UP
		if tilemap_get_at_pixel(global.map,bbox_left+4*1,bbox_top) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,bbox_right+4*1,bbox_top) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2+4*1,bbox_top) == COLLISION_TILES.DOOR
		{
			room_goto(rm_room2);
		}	
}
if room == rm_room2
{
	if tilemap_get_at_pixel(global.map,bbox_right+4,bbox_bottom) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,bbox_right+4*1,bbox_top) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,bbox_right+4*1,(bbox_bottom+bbox_top)/2) == COLLISION_TILES.DOOR
		{
			room_goto(rm_room1);
		}
	if tilemap_get_at_pixel(global.map,bbox_left+4,bbox_bottom) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,bbox_left+4*1,bbox_top) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,bbox_left+4*1,(bbox_bottom+bbox_top)/2) == COLLISION_TILES.DOOR
		{
			room_goto(rm_room1);
		}
	//DOWN
	if tilemap_get_at_pixel(global.map,bbox_left+4,bbox_bottom) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,bbox_right+4*1,bbox_bottom) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2+4*1,bbox_bottom) == COLLISION_TILES.DOOR
		{
			room_goto(rm_room1);
		}
	//UP
	if tilemap_get_at_pixel(global.map,bbox_left+4*1,bbox_top) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,bbox_right+4*1,bbox_top) == COLLISION_TILES.DOOR or tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2+4*1,bbox_top) == COLLISION_TILES.DOOR
		{
			room_goto(rm_room1);
		}	
}
//move to battle
if tilemap_get_at_pixel(global.map,bbox_right+4,bbox_bottom) == COLLISION_TILES.ENEMY or tilemap_get_at_pixel(global.map,bbox_right+4*1,bbox_top) == COLLISION_TILES.ENEMY or tilemap_get_at_pixel(global.map,bbox_right+4*1,(bbox_bottom+bbox_top)/2) == COLLISION_TILES.ENEMY
	{
		global.player_respawn_x = (x-50);
		global.player_respawn_y = (y+50);
		room_goto(rm_room3);
	}
if tilemap_get_at_pixel(global.map,bbox_left+4,bbox_bottom) == COLLISION_TILES.ENEMY or tilemap_get_at_pixel(global.map,bbox_left+4*1,bbox_top) == COLLISION_TILES.ENEMY or tilemap_get_at_pixel(global.map,bbox_left+4*1,(bbox_bottom+bbox_top)/2) == COLLISION_TILES.ENEMY
	{
		global.player_respawn_x = (x-50);
		global.player_respawn_y = (y+50);
		room_goto(rm_room3);
	}
if tilemap_get_at_pixel(global.map,bbox_left+4,bbox_bottom) == COLLISION_TILES.ENEMY or tilemap_get_at_pixel(global.map,bbox_right+4*1,bbox_bottom) == COLLISION_TILES.ENEMY or tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2+4*1,bbox_bottom) == COLLISION_TILES.ENEMY
	{
		global.player_respawn_x = (x-50);
		global.player_respawn_y = (y+50);
		room_goto(rm_room3);
	}
if tilemap_get_at_pixel(global.map,bbox_left+4*1,bbox_top) == COLLISION_TILES.ENEMY or tilemap_get_at_pixel(global.map,bbox_right+4*1,bbox_top) == COLLISION_TILES.ENEMY or tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2+4*1,bbox_top) == COLLISION_TILES.ENEMY
	{
		global.player_respawn_x = (x-50);
		global.playe_respawn_y = (y+50);
		room_goto(rm_room3);
	}	
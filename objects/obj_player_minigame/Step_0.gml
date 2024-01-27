//GETTING INPUTS
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);


if grounded = true
{
	horizontal_velocity = 0;
}

//CHECK FOR GROUND
/*
if (place_meeting(x,y+1,obj_collision))
{
	grounded = true;
}
*/


if (tilemap_get_at_pixel(global.map,bbox_right,bbox_bottom+1) == COLLISION_TILES.WALL
or tilemap_get_at_pixel(global.map,bbox_left,bbox_bottom+1) == COLLISION_TILES.WALL
or tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2,bbox_bottom+1) == COLLISION_TILES.WALL)
{
	grounded = true;
}
else
{
	grounded = false;
	if vertical_velocity > 0
	{
		sprite_index = spr_player_minigame_jump
		image_index = 1;
	}
	else
	{
		sprite_index = spr_player_minigame_jump
		image_index = 2;
	}
}



//JUMP CALCULATIONS
if grounded = true
{
	if global.in_jump_meter
	{
		sprite_index = spr_player_minigame_jump;
		image_index = 0;
	}
	else
	{
		sprite_index = spr_player_minigame_idle;
	}
	if keyboard_check(vk_space)
	{
		sprite_index = spr_player_minigame_jump;
		image_index = 0;
		global.in_jump_meter = true;
	    global.time += 1/room_speed;
		global.time_held = global.time;
		global.percent_held = (global.time / max_jump_time);
	    if (global.time>=max_jump_time)
		{
			global.time_held = global.time;
			global.time = 0;
			we_jumpin = true;
			grounded = false;
			global.in_jump_meter = false;
	    }
	}
	
	if keyboard_check_released(vk_space)
	{
		global.time_held = global.time;
		global.time = 0;
		we_jumpin = true;
		grounded = false;
		global.in_jump_meter = false;
	    
	}
	if we_jumpin
	{
		global.percent_held = (global.time_held / max_jump_time);
		vertical_velocity -= (0.5 +(global.percent_held/2)) * jump_height_power;
		horizontal_velocity += (1 - global.percent_held) * jump_length_power;
		we_jumpin = false;
	}
	
	


	/*
	if (grounded = true) && (key_jump)
	{
		vertical_velocity -= jump_height_power;
	}
	*/

}

var _move = key_right - key_left;
/*
if grounded = true
{
	horizontal_velocity = _move * walk_speed;
}
*/


vertical_velocity = vertical_velocity + our_gravity;

//CALCULATING JUMP ANGLE



if (!grounded) && (horizontal_velocity == 0)
{
	horizontal_velocity = 1;
}








/*

if place_meeting(x + horizontal_velocity, y, obj_collision)
{
	while(!place_meeting(x + sign(horizontal_velocity), y, obj_collision))
	{
		x = x + sign(horizontal_velocity);
	}
	horizontal_velocity = 0;
}






if place_meeting(x, y + vertical_velocity, obj_collision)
{
	while(!place_meeting(x, y+ sign(vertical_velocity), obj_collision))
	{
		y = y + sign(vertical_velocity);
	}
	vertical_velocity = 0;
}

*/


////////////////////////////

//COLLISION CHECKS

//check right
if tilemap_get_at_pixel(global.map,bbox_right+horizontal_velocity,bbox_bottom) == COLLISION_TILES.WALL
or tilemap_get_at_pixel(global.map,bbox_right+horizontal_velocity,bbox_top) == COLLISION_TILES.WALL
or tilemap_get_at_pixel(global.map,bbox_right+horizontal_velocity,(bbox_bottom+bbox_top)/2) == COLLISION_TILES.WALL
{
	horizontal_velocity = 0;
	while tilemap_get_at_pixel(global.map,bbox_right+1,bbox_bottom) != COLLISION_TILES.WALL
	and tilemap_get_at_pixel(global.map,bbox_right+1,bbox_top) != COLLISION_TILES.WALL
	and tilemap_get_at_pixel(global.map,bbox_right+1,(bbox_bottom+bbox_top)/2) != COLLISION_TILES.WALL
	{
		x += 1;
	}
}
//check left
else if horizontal_velocity < 0
{
	if tilemap_get_at_pixel(global.map,bbox_left+horizontal_velocity,bbox_bottom) == COLLISION_TILES.WALL
	or tilemap_get_at_pixel(global.map,bbox_left+horizontal_velocity,bbox_top) == COLLISION_TILES.WALL
	or tilemap_get_at_pixel(global.map,bbox_left+horizontal_velocity,(bbox_bottom+bbox_top)/2) == COLLISION_TILES.WALL
	{
		horizontal_velocity = 0;
		while tilemap_get_at_pixel(global.map,bbox_left-1,bbox_bottom) != COLLISION_TILES.WALL
		and tilemap_get_at_pixel(global.map,bbox_left-1,bbox_top) != COLLISION_TILES.WALL
		and tilemap_get_at_pixel(global.map,bbox_left-1,(bbox_bottom+bbox_top)/2) != COLLISION_TILES.WALL
		{
			x -= 1;
		}
	}
}
//check below
if vertical_velocity > 0
{
	if tilemap_get_at_pixel(global.map,bbox_right,bbox_bottom+vertical_velocity) == COLLISION_TILES.WALL
	or tilemap_get_at_pixel(global.map,bbox_left,bbox_bottom+vertical_velocity) == COLLISION_TILES.WALL
	or tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2,bbox_bottom+vertical_velocity) == COLLISION_TILES.WALL
	{
	    vertical_velocity = 0;
	    while tilemap_get_at_pixel(global.map,bbox_right,bbox_bottom+1) != COLLISION_TILES.WALL
		and tilemap_get_at_pixel(global.map,bbox_left,bbox_bottom+1) != COLLISION_TILES.WALL
		and tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2,bbox_bottom+1) != COLLISION_TILES.WALL
	    {
	        y+=1;
	    }
	}
    
}
//check above
else if vertical_velocity < 0
{//check above
	if tilemap_get_at_pixel(global.map,bbox_right,bbox_top+vertical_velocity) == COLLISION_TILES.WALL
	or tilemap_get_at_pixel(global.map,bbox_left,bbox_top+vertical_velocity) == COLLISION_TILES.WALL
	or tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2,bbox_top+vertical_velocity) == COLLISION_TILES.WALL
	{
	    vertical_velocity = 0;
	    while tilemap_get_at_pixel(global.map,bbox_right,bbox_top-1) != COLLISION_TILES.WALL
		and tilemap_get_at_pixel(global.map,bbox_left,bbox_top-1) != COLLISION_TILES.WALL
		and tilemap_get_at_pixel(global.map,(bbox_right+bbox_left)/2,bbox_top-1) != COLLISION_TILES.WALL
	    {
	        y-=1;
        
	    }
	}
}

///////////////////////////////



//APPLY MOVEMENT
x = x + horizontal_velocity;

y = y + vertical_velocity;
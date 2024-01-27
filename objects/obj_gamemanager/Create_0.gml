global.map = layer_tilemap_get_id("Collisions");
global.tilesize = 32;
global.gravity = 10;
enum COLLISION_TILES
{
	EMPTY,
	WALL,
	ENEMY,
	DOOR,
	NULL,
}


//Set this to be the size of your GAME RESOLUTION
display_set_gui_size(1920, 1080);


//window_set_size(1920, 1080);
// Get the width and height of the primary display
_screen_width = display_get_width();
_screen_height = display_get_height() - 77;

// Set the game window size to match the screen resolution
window_set_size(_screen_width, _screen_height);

// Center the game window on the screen (optional)
window_set_position((display_get_width() - window_get_width()) / 2, (display_get_height() - window_get_height()) / 2);

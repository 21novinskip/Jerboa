horizontal_velocity = 0;
vertical_velocity = 0;
our_gravity = 0.3;
walk_speed = 4;

jump_height_power = 15;
jump_length_power = 15;

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

grounded = false;

global.time = 0;
global.time_held = 0;
max_jump_time = 3
global.percent_held = 0;
we_jumpin = false;
global.in_jump_meter = false;
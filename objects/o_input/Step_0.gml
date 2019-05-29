if(keyboard_check_pressed(key_up)) last_key = key_up;
if(keyboard_check_pressed(key_down)) last_key = key_down;
if(keyboard_check_pressed(key_left)) last_key = key_left;
if(keyboard_check_pressed(key_right)) last_key = key_right;

up = keyboard_check_pressed(key_up) && last_key == key_up;
left = keyboard_check_pressed(key_left) && last_key == key_left;
right = keyboard_check_pressed(key_right) && last_key == key_right;
down = keyboard_check_pressed(key_down) && last_key == key_down;

up_hold = keyboard_check(key_up) && last_key == key_up;
left_hold = keyboard_check(key_left) && last_key == key_left;
right_hold = keyboard_check(key_right) && last_key == key_right;
down_hold = keyboard_check(key_down) && last_key == key_down;

action = keyboard_check_pressed(key_action);
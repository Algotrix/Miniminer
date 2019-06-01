if(keyboard_check_pressed(_key_up)) last_key = _key_up;
if(keyboard_check_pressed(_key_down)) last_key = _key_down;
if(keyboard_check_pressed(_key_left)) last_key = _key_left;
if(keyboard_check_pressed(_key_right)) last_key = _key_right;

key_up = keyboard_check_pressed(_key_up) && last_key == _key_up;
key_left = keyboard_check_pressed(_key_left) && last_key == _key_left;
key_right = keyboard_check_pressed(_key_right) && last_key == _key_right;
key_down = keyboard_check_pressed(_key_down) && last_key == _key_down;

key_up_hold = keyboard_check(_key_up);
key_left_hold = keyboard_check(_key_left);
key_right_hold = keyboard_check(_key_right);
key_down_hold = keyboard_check(_key_down);

key_action = keyboard_check_pressed(_key_action);

// special keys
key_any = key_up || key_left || key_right || key_down || key_action;
///@description Main function for moving. Checks what to do and selects the rights state.
///@arg direction (0 = up, 1 = right, 2 = down, 3 = left)

var _x_pos_new = 0;
var _y_pos_new = 0;

var _action_dir = argument0;
last_action_dir = _action_dir;

switch(_action_dir)
{
	case dir_none:
		exit;
	case dir_up:
		_x_pos_new = x_pos
		_y_pos_new = y_pos - 1
		break;
	case dir_right:
		_x_pos_new = x_pos + 1
		_y_pos_new = y_pos
		break;
	case dir_down:
		_x_pos_new = x_pos
		_y_pos_new = y_pos + 1
		break;
	case dir_left:
		_x_pos_new = x_pos - 1
		_y_pos_new = y_pos
		break;
}


// check ob Bewegung 
var _special = get_special(_x_pos_new, _y_pos_new);
var _block = get_block(_x_pos_new, _y_pos_new);
var _collectible = get_collectible(_x_pos_new, _y_pos_new);

x_pos_new = _x_pos_new;
y_pos_new = _y_pos_new;

if(instance_exists(_special))
{
	dbg("special found");
	if(_special.object_index == b_special_event.object_index)
	{
		dbg("special event " + _special.trigger_event);	
		if((_special.num_triggers < _special.max_triggers || _special.max_triggers < 0) && !_special.needs_action)
		{
			o_events.a_event = _special.trigger_event;
			o_events.a_event_delay = _special.trigger_delay;
			_special.num_triggers += 1;
		}
	}
}

if(_block.is_impassable)
{
	state = "idle";
}
else if(special_cant_move_up && move_dir == dir_up)
{
	state = "moveblocked";
	player_drain_stamina(global.stamina_drain_moveblocked);
}
else if(!_block.is_solid)
{
	if(instance_exists(_collectible))
	{
		state = "collect";
		player_drain_stamina(global.stamina_drain_move);
	}
	else
	{
		state = "move";
		player_drain_stamina(global.stamina_drain_move);
	}
}
else
{
	if(global.mine_level < _block.mine_minlevel)
	{
		state = "moveblocked";	
		player_drain_stamina(global.stamina_drain_moveblocked);
	}
	else
	{
		state = "mine";	
		player_drain_stamina(global.stamina_drain_mine);
	}
}
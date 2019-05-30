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


// check ob Bewegung möglich
var _block = get_block(_x_pos_new, _y_pos_new);
var _collectible = get_collectible(_x_pos_new, _y_pos_new);

x_pos_new = _x_pos_new;
y_pos_new = _y_pos_new;

if(!_block.is_solid)
{
	if(instance_exists(_collectible))
	{
		state = "collect";
		player_drain_stamina(o_stats.stamina_drain_move);
	}
	else
	{
		state = "move";
		player_drain_stamina(o_stats.stamina_drain_move);
	}
}
else
{
	if(o_stats.mine_level < _block.mine_minlevel)
	{
		state = "moveblocked";	
		player_drain_stamina(o_stats.stamina_drain_moveblocked);
	}
	else
	{
		state = "mine";	
		player_drain_stamina(o_stats.stamina_drain_mine);
	}
}
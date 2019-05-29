///@description Move to the xy_pos_new position smoothliy within the step-loop and transfers to next state
///@arg next_state
var _next_state = argument0;

x = approach(x, pos(x_pos_new), move_spd);
y = approach(y, pos(y_pos_new), move_spd);
	
if(x == x_pos_new * 8 && y == y_pos_new * 8)
{
	set_pos(x_pos_new, y_pos_new)
	state = _next_state;
}
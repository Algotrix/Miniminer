///@description Move to the xy_pos_new position smoothliy within the step-loop and transfers to next state
///@arg next_state
var _next_state = argument0;

x = approach(x, apos(x_pos_new), global.move_spd);
y = approach(y, apos(y_pos_new), global.move_spd);
	
if(x == apos(x_pos_new) && y == apos(y_pos_new))
{
	set_pos(x_pos_new, y_pos_new)
	state = _next_state;
}
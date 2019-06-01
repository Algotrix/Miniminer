if(x_pos == x_pos_new && y_pos == y_pos_new && is_in_jump_area())
{
	var _block_below = get_block(x_pos, y_pos + 1);
	if(!block_empty(_block_below) && !_block_below.is_solid && !_block_below.can_stand_if_not_solid)
	{
		state = "fall";
	}
	else if(block_empty(_block_below))
	{
		set_pos(pos(x), pos(y));
		state = "fall";	
	}
}
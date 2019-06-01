///@arg x_pos or block
///@arg y_pos

if(argument_count == 1)
{
	var _block = argument[0];
}
else if(argument_count == 2)
{
	var _x_pos = argument[0];
	var _y_pos = argument[1];

	var _block = get_block(_x_pos, _y_pos);
}
else
{
	return true;
}
return !instance_exists(_block) || _block == b_empty;
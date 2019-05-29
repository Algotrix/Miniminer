///@arg x_pos
///@arg y_pos
///@arg block
///@arg background
///@arg replace

var _x_pos = argument0;
var _y_pos = argument1;
var _block = argument2;
var _background = argument3;
var _replace = argument4;

if(_replace)
{
	var _block_back = get_block_background(_x_pos, _y_pos);
	if(instance_exists(_block_back) && _block_back != b_empty)
	{
		remove_block_background(_x_pos, _y_pos);
		dbg("------------!!!!!!!!!!!!!!!!!!!!!!! destroyed old background block");
	}
}
instance_create_layer(_x_pos * 8, _y_pos * 8, "blocks_back", _background);

if(_replace)
{
	var _block_old = get_block(_x_pos, _y_pos);
	if(instance_exists(_block_old) && _block_back != b_empty)
	{
		remove_block(_x_pos, _y_pos);
		dbg("------------!!!!!!!!!!!!!!!!!!!!!!! destroyed old block");
	}
}

return instance_create_layer(_x_pos * 8, _y_pos * 8, "blocks", _block);;
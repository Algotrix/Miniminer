///@arg x_pos
///@arg y_pos
///@arg layer

var _x_pos = argument0;
var _y_pos = argument1;
var _layer = argument2;
var _blocks = ds_list_create();

instance_position_list(apos(_x_pos), apos(_y_pos), bb_block, _blocks, true);

var _return_block = noone;

for(var i = 0; i < ds_list_size(_blocks); i++)
{
	var _block = ds_list_find_value(_blocks, i);
	if(_block.layer == layer_get_id(_layer)) 
	{
		_return_block = _block;
	}
}

dbg("get_block " + string(_x_pos) + "," + string(_y_pos) + " layer  " + string(_layer) + " - found: " + string(_return_block))

ds_list_destroy(_blocks);

return _return_block;
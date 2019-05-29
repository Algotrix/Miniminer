///@arg x_pos
///@arg y_pos
///@arg layer

var _x_pos = argument0;
var _y_pos = argument1;
var _layer = argument2;
var _blocks = ds_list_create();

instance_position_list(_x_pos * 8, _y_pos * 8, bb_block, _blocks, true);

dbg("get_block " + string(_x_pos) + "," + string(_y_pos) + " - found: " + string(ds_list_size(_blocks)))

for(var i = 0; i < ds_list_size(_blocks); i++)
{
	var _block = ds_list_find_value(_blocks, i);
	if(_block.layer == layer_get_id(_layer)) 
	{
		ds_list_destroy(_blocks);
		return _block;
	}
}

ds_list_destroy(_blocks);
return b_empty;
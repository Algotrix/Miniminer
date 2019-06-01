///@arg x_pos
///@arg y_pos
///@arg layer
///@arg optional base object for getting e.g. a specific area when they overlap

var _x_pos = argument[0];
var _y_pos = argument[1];
var _layer = argument[2];
var _blocks = ds_list_create();

var _object_type = noone;
if(_layer == layer_blocks) _object_type = bb_block;
if(_layer == layer_background) _object_type = bb_block;
if(_layer == layer_collectibles) _object_type = cb_collectible;
if(_layer == layer_special) _object_type = bb_special_block;
if(_layer == layer_areas) _object_type = area_base;

if(argument_count >= 4) _object_type = argument[3];

instance_position_list(apos(_x_pos), apos(_y_pos), _object_type, _blocks, true);

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
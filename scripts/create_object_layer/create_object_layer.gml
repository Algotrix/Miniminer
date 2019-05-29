///@arg x_pos
///@arg y_pos
///@arg object
///@arg layer
///@arg replace

var _x_pos = argument0;
var _y_pos = argument1;
var _object = argument2;
var _layer = argument3;
var _replace = argument4;

if(_replace)
{
	var _block_old = get_object_layer(_x_pos, _y_pos, _layer);
	if(instance_exists(_block_old) && _block_old != b_empty)
	{
		remove_object_layer(_x_pos, _y_pos, _layer);
		dbg("------------!!!!!!!!!!!!!!!!!!!!!!! create & destroyed old block at " + string(_x_pos) +  "," + string(_y_pos) + " layer " + _layer);
	}
}

return instance_create_layer(_x_pos * 8, _y_pos * 8, _layer, _object);;
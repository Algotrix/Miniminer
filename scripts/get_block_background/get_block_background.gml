///@arg x_pos
///@arg y_pos

var _x_pos = argument0;
var _y_pos = argument1;
var _blocks = ds_list_create();

var _block = get_object_layer(_x_pos, _y_pos, layer_background);
if(instance_exists(_block))
{
	return _block;
}
else
{
	return b_empty;	
}
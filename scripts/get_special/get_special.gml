///@arg x_pos
///@arg y_pos

var _x_pos = argument0;
var _y_pos = argument1;

var _block = get_object_layer(_x_pos, _y_pos, layer_special);
if(instance_exists(_block))
{
	return _block;
}
else
{
	return noone;	
}
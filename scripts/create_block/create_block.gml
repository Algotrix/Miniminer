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

var _return = noone;

if(_background != noone)
{
	_return = create_object_layer(_x_pos, _y_pos, _background, layer_background, _replace);
}
if(_block != noone)
{
	_return = create_object_layer(_x_pos, _y_pos, _block, layer_blocks, _replace);
}

return _return;
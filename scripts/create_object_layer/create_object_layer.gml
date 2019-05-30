///@arg x_pos
///@arg y_pos
///@arg object
///@arg layer
///@arg replace (2 == place even if there's already a block there

var _x_pos = argument0;
var _y_pos = argument1;
var _object = argument2;
var _layer = argument3;
var _replace = argument4;


var _block_old = get_object_layer(_x_pos, _y_pos, _layer);
if(instance_exists(_block_old) && _block_old != b_empty)
{
	if(_replace)
	{
		remove_object_layer(_x_pos, _y_pos, _layer);
		dbg("------------!!!!!!!!!!!!!!!!!!!!!!! create & destroyed old block at " + string(_x_pos) +  "," + string(_y_pos) + " layer " + _layer);
	}
	else if(!_replace)
	{
		return noone;	
	}
}

return instance_create_layer(apos(_x_pos), apos(_y_pos), _layer, _object);
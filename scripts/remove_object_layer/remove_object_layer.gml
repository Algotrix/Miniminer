///@arg x_pos
///@arg y_pos
var _x_pos = argument0;
var _y_pos = argument1;
var _layer = argument2;

var _object = get_object_layer(_x_pos, _y_pos, _layer)

if(instance_exists(_object) && _object != b_empty)
{
	dbg("--------- removing object " + string(_object) + " at " + string(_x_pos) +  "," + string(_y_pos) + " layer " + _layer);
	instance_destroy(_object);
}
else
{
	dbg("--------- no block at " + string(_x_pos) +  "," + string(_y_pos) + " layer " + _layer);
}

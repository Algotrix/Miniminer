///@arg x_pos
///@arg y_pos
///@arg item
///@arg amount

var _x_pos = argument0;
var _y_pos = argument1;
var _item = argument2;
var _amount = argument3

for(var i = 0; i < _amount; i++)
{
	var _y = apos(_y_pos) + apos(1) - 1;
	var _new_item = instance_create_layer(apos(_x_pos), _y, layer_drops, _item);
	
	var _bbox_width = _new_item.bbox_right + 1 - _new_item.bbox_left;

	var _min_x = apos(_x_pos) + _bbox_width / 2;
	var _max_x = apos(_x_pos) + apos(1) - _bbox_width / 2;
	
	_new_item.x = random_range(_min_x, _max_x);
	
	dbg("item drop: " + string(_new_item.x) + "," + string(_y));
}
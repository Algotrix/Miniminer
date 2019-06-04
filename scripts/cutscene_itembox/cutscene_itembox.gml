///@arg text
///@arg item
///@arg flavor_text
///@arg color_text
///@arg color_flavor_text
///@arg color_box
///@arg color_frame

var _text = argument0;
var _item = argument1;
var _flavor_text = argument2;
var _color_text = argument3;
var _color_flavor_text = argument4;
var _color_box = argument5;
var _color_frame = argument6;

if(current_itembox == noone)
{
	current_itembox = instance_create_layer(-1, -1, layer_game, o_itembox);
	with(current_itembox)
	{
		text = _text;
		flavor_text = _flavor_text;
		color_flavor_text = _color_flavor_text;
		item_sprite = _item;
		color_box = _color_box;
		color_frame = _color_frame;
		color_text = _color_text;
	}
}
if(!instance_exists(current_itembox))
{
	current_itembox = noone;	
	cutscene_end_action();
}
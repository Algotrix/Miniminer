///@arg text
///@arg item
///@arg color_box
///@arg color_frame
///@arg color_text

var _text = argument0;
var _item = argument1;
var _color_box = argument2;
var _color_frame = argument3;
var _color_text = argument4;

if(current_itembox == noone)
{
	current_itembox = instance_create_layer(-1, -1, layer_game, o_itembox);
	with(current_itembox)
	{
		text = _text;
		flavor_text = "";
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
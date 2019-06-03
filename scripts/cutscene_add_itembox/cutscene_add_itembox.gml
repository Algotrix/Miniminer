///@description 
///@arg cutscene
///@arg text
///@arg item
///@arg (color_box)
///@arg (color_frame)
///@arg (color_text)

var _cutscene = 0; 
var _text = 0;
var _item = 0;
var _color_box = 0;
var _color_frame = 0;
var _color_text = 0;

if(argument_count >= 1) _cutscene = argument[0];
if(argument_count >= 2) _text = argument[1];
if(argument_count >= 3) _item = argument[2];
if(argument_count >= 4) _color_box = argument[3];
if(argument_count >= 5) _color_frame = argument[4];
if(argument_count >= 6) _color_text = argument[5];

cutscene_add(_cutscene, cutscene_itembox, _text, _item, _color_box, _color_frame, _color_text);
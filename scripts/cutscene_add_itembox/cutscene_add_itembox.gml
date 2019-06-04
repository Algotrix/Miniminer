///@description 
///@arg cutscene
///@arg text
///@arg item
///@arg flavor_text
///@arg color_text
///@arg color_flavor_text
///@arg color_box
///@arg color_frame

var _cutscene = 0; 
var _text = "";
var _item = 0;
var _flavor_text = "";
var _color_box = c_black;
var _color_frame = c_white;
var _color_text = c_white;
var _color_flavor_text = c_gray;

if(argument_count >= 1) _cutscene = argument[0];
if(argument_count >= 2) _text = argument[1];
if(argument_count >= 4) _item = argument[2];
if(argument_count >= 3) _flavor_text = argument[3];
if(argument_count >= 5) _color_text = argument[4];
if(argument_count >= 6) _color_flavor_text = argument[5];
if(argument_count >= 7) _color_box = argument[6];
if(argument_count >= 8) _color_frame = argument[7];

cutscene_add(_cutscene, cutscene_itembox, _text, _item, _flavor_text, _color_text, _color_flavor_text, _color_box, _color_frame);
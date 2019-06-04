///@arg color

var _color = argument0;

var _layer_id = layer_get_id("Background");
var _back_id = layer_background_get_id(_layer_id);

layer_background_blend(_back_id, _color);

///@arg x_pos
///@arg y_pos
///@arg collectible

var _x_pos = argument0;
var _y_pos = argument1;
var _collectible = argument2;
var _replace = true;

return create_object_layer(_x_pos, _y_pos, _collectible, layer_collectibles, _replace);
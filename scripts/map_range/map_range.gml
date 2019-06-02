///@description sets the value in percentage between the min and max value
///@arg min
///@arg max
///@arg value
///@arg mapto_min
///@arg mapto_max


var _min = argument0;
var _max = argument1;
var _value = argument2;
var _mapto_min = argument3;
var _mapto_max = argument4;

var _val_range = _max - _min;
var _val_percent = (_value - _min) / _val_range * 100;
var _map_range = _mapto_max - _mapto_min;
var _return = _mapto_min + (_map_range / 100 * _val_percent);

return _return;
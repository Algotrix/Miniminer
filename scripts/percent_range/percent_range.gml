///@description sets the value in percentage between the min and max value
///@arg min
///@arg max
///@arg percent

var _min = argument0;
var _max = argument1;
var _percent = argument2;

return _min + ((_max - _min) / 100 * _percent);
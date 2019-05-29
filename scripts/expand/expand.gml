///@description Increases or decreases the amount by value depending if the number is positive or negative

///@arg value
///@arg amount
var _value = argument0;
var _amount = argument1;

if(_value >= 0) return _amount + _value;
if(_value < 0) return _amount - _value;
return _amount;
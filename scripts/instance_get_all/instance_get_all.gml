///@arg object_type

var _object_type = argument0;

var _num = instance_number(_object_type);
var _objects = array_create(_num, noone);
for (var i = 0; i < _num; i++)
{
    _objects[i] = instance_find(_object_type, i);
}
return _objects;
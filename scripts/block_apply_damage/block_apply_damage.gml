///@arg block
///@arg damage
///@arg from_direction

var _block = argument0;
var _damage = argument1;
var _from_direction = argument2;

_block.a_recieve_damage += _damage;
_block.a_recieve_damage_hit_from = _from_direction;
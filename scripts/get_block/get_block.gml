///@arg x
///@arg y

var _x = argument0;
var _y = argument1;
var block = instance_position(_x * 8, _y * 8, bb_block);

if(!instance_exists(block))
{
	block = b_empty;
}

return block;
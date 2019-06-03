/// @description Hier Beschreibung einfügen
var _blocks = instance_get_all(bb_fake_block);

for(var i = 0; i < array_length_1d(_blocks); i++)
{
	var _block = _blocks[i];
	if(_block.fade_group  == fade_group)
	{
		_block.image_alpha = lerp(_block.image_alpha, 0.3, 0.1);	
	}
	else
	{
		_block.image_alpha = 255;		
	}
}
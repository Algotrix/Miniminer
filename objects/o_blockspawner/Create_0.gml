/// @description Hier Beschreibung einfügen
max_blocks_x = room_width / 8;
max_blocks_y = room_height / 8;

for(var _x_pos = 0;  _x_pos < max_blocks_x; _x_pos++)
{
	for(var _y_pos = 8; _y_pos < max_blocks_y - 8; _y_pos++)
	{
		create_block(_x_pos, _y_pos, b_earth, b_earth_back, true);
	}
}

create_random_block_amount(10, max_blocks_y - 10, 100, b_earth_iron, b_earth_back);

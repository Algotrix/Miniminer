/// @description Hier Beschreibung einfügen

// FUN!!! :)
//create_random_block_amount(10, 14, 1, b_earth_iron, b_earth_back);
//create_random_block_amount(10, 14, 1, b_earth, b_earth_back);

max_blocks_x = 24;  //room_width / 8 - 1;
max_blocks_y = room_height / 8 - 1;

if(block_init) exit;

random_set_seed(current_time);

// process fill blocks
with(b_special_fill)
{
	fill_simple(pos(x), pos(y), block, block_background, replace);
}

for(var _x_pos = 0;  _x_pos <= max_blocks_x; _x_pos++)
{
	for(var _y_pos = 8; _y_pos <= max_blocks_y; _y_pos++)
	{
		if(instance_exists(get_collectible(_x_pos, _y_pos)))
		{
			// if collectible is there, djust spawn background
			create_block(_x_pos, _y_pos, noone, b_earth_back, false)
		}
		else
		{
			create_block(_x_pos, _y_pos, b_earth, b_earth_back, false)
		};
	}
}

create_random_blocks(30, max_blocks_y, 30, b_earth_iron, b_earth_back);

create_random_collectibles(10, 15, 3, c_shiny_green, true); // mind 3 am Anfang ;)
create_random_collectibles(11, max_blocks_y, 50, c_shiny_green, true);
create_random_collectibles(11, max_blocks_y, 100, c_shiny_green, false);
create_random_collectibles(25, max_blocks_y, 25, c_shiny_red, true);
create_random_collectibles(10, max_blocks_y, 50, c_shiny_red, false);
create_random_collectibles(50, max_blocks_y, 10, c_shiny_blue, true);
create_random_collectibles(10, max_blocks_y, 50, c_shiny_blue, false);


block_init = true;	
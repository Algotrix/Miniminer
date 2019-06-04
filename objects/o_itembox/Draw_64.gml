var _dw = display_get_gui_width();
var _dh = display_get_gui_height();

var _x1 = 8;
var _y1 = 8;
var _x2 = _dw - 8;
var _y2 = _dh - 8;

var _text_center_x = _dw / 2;
var _text_center_y = _dh / 4;

var _flavor_text_center_x = _dw / 2;
var _flavor_text_center_y = _dh / 4 * 3;

var _item_center_x = _dw / 2;
var _item_center_y = _dh / 2;


draw_save();

// frame
draw_textbox_frame(_x1, _y1, _x2, _y2, color_box, color_frame);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

//text
draw_set_color(color_text);
draw_text_ext(_text_center_x, _text_center_y, text, string_height("ABC") + 2, _x2 - _x1 - 10);

//flavor text
draw_set_color(color_flavor_text);
draw_text_ext(_flavor_text_center_x, _flavor_text_center_y, flavor_text, string_height("ABC") + 2, _x2 - _x1 - 10);


// item
draw_sprite_ext(item_sprite, 0, _item_center_x - sprite_get_width(item_sprite), _item_center_y - sprite_get_height(item_sprite), 2, 2, 0, -1, 255);

draw_load();

var _dw = display_get_gui_width();
var _dh = display_get_gui_height();

draw_save();

draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_set_font(font_death);
draw_set_color(c_red);
draw_text(_dw / 2, _dh * 0.3, die_text);

draw_set_font(font_text);
draw_set_color(c_white);
draw_text_ext(_dw / 2, _dh * 0.6, sub_text, string_height("X") + 2, _dw * 0.9);

draw_load();
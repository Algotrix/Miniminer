// init
draw_set_font(font_text);


// action events

a_show = false;
a_show_text_lines = ds_list_create();
a_show_position = ds_list_create();
a_show_continue_wait = ds_list_create();
a_show_continue_wait_skippable = ds_list_create();
a_show_color_dialog = ds_list_create();
a_show_color_frame = ds_list_create();
a_show_color_text = ds_list_create();
a_show_name = ds_list_create();
a_show_color_name = ds_list_create();

// states
state = "";

continue_delay_counter = a_show_continue_wait;
show_line = 0;
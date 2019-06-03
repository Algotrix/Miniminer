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

// todo: optional additions
dialog_option0 = "";
dialog_option1 = "";
dialog_returnindex = -1;

// get-states
is_finished = false;

// states
state = "";
counter_init = false;

continue_delay_counter = 0;
continue_min_delay = 20;
show_line = 0;
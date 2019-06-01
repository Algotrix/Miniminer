///@description show_textbox(char, text1, text2, text,3, ...)
textbox_get_dialogue_colors(argument[0]);

if(argument_count >= 2) textbox_add(argument[1], false, 60, false, char_color_dialog, char_color_frame, char_color_text);
if(argument_count >= 3) textbox_add(argument[2], false, 60, false, char_color_dialog, char_color_frame, char_color_text);
if(argument_count >= 4) textbox_add(argument[3], false, 60, false, char_color_dialog, char_color_frame, char_color_text);
if(argument_count >= 5) textbox_add(argument[4], false, 60, false, char_color_dialog, char_color_frame, char_color_text);
if(argument_count >= 6) textbox_add(argument[5], false, 60, false, char_color_dialog, char_color_frame, char_color_text);
if(argument_count >= 7) textbox_add(argument[6], false, 60, false, char_color_dialog, char_color_frame, char_color_text);
if(argument_count >= 8) textbox_add(argument[7], false, 60, false, char_color_dialog, char_color_frame, char_color_text);
if(argument_count >= 9) textbox_add(argument[8], false, 60, false, char_color_dialog, char_color_frame, char_color_text);
if(argument_count >= 10) textbox_add(argument[9], false, 60, false, char_color_dialog, char_color_frame, char_color_text);

textbox_show_ext();
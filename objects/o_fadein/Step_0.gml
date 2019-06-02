/// @description Handle Fade

if(global.debug_quickmode) duration = 10;

if(delayDelta < delay){ //wait for delay to end
    delayDelta++;
} else if(delta < duration) { //calculate alpha based on duration
    delta++;
    alpha = 1 - (((delta / duration) / 1) * 1);
    show_debug_message(alpha);
} else {
    //end of transition event goes here    
	fadein_done = true;
}
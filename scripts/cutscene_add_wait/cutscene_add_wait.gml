///arg cutscene
///arg seconds

var _cutscene = argument0;
var _seconds = argument1;

cutscene_add(_cutscene, cutscene_wait, _seconds);
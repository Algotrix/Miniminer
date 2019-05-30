///@arg rgb_string

var _rgb_string = argument0;
var _result=0;

// flip BGR
_rgb_string = string_copy(_rgb_string, 5, 2) + string_copy(_rgb_string, 3, 2) + string_copy(_rgb_string, 1, 2);
 
// special unicode values
var _ZERO=ord("0");
var _NINE=ord("9");
var _A=ord("A");
var _F=ord("F");
 
for (var i=1; i<=string_length(_rgb_string); i++){
    var _c=ord(string_char_at(string_upper(_rgb_string), i));
    // you could also multiply by 16 but you get more nerd points for bitshifts
    _result=_result<<4;
    // if the character is a number or letter, add the value
    // it represents to the total
    if (_c >= _ZERO && _c <= _NINE){
        _result=_result + (_c - _ZERO);
    } else if (_c >= _A && _c <= _F){
        _result = _result + (_c - _A + 10);
    // otherwise complain
    } else {
        // this will make the browser behave badly but you can leave it in
        // actual game maker if you want
        //show_error("bad input for hex(str)", true);
    }
}
 
return _result;
TF47_UMenu_isUMenuEnabled = true;
publicVariable "TF47_UMenu_isUMenuEnabled";

TF47_UMenu_showTickets = _this select 0;
publicVariable "TF47_UMenu_showTickets";

if (isNil "TF47_UMenu_FreqTracker_Logic") then {
	_group = createGroup east;
	"Logic" createUnit [[0,0,0],_group,"TF47_UMenu_FreqTracker_Logic=this"]; 
};
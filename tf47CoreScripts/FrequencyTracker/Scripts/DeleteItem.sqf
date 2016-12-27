//Script by DerZade
disableSerialization;
private ["_dialog","_curSel","_var"];
_dialog = uiNamespace getVariable "TF47_Freq_Tracker";
_ctrl = _dialog displayCtrl 1500;
_curSel = lbCurSel _ctrl;

//Check if a item is sleected
if (_curSel == -1) exitWith {};

_var = TF47_FreqTracker_Logic getVariable ["TF47_FrequencyTracker",[]];

//get item 
_item = _var select _curSel;

//Delete Marker
_markerName = format ["M_FreqTracker_%1",_curSel];
deleteMarker _markerName;

//replace all other Marker
for "_i" from _curSel to count _var -1 do {
		//delete old Marker
		_markerName = format ["M_FreqTracker_%1",_i];
		_type = MarkerType _markerName;
		_text = markerText _markerName;
		deleteMarker _markerName;

		//create new Marker
		_yoffset = 200* (_i -1);
		_markerName = format ["M_FreqTracker_%1",(_i -1)];
		_marker = createMarker [_markerName,[(getMarkerPos "M_SquadMarker") select 0,(((getMarkerPos "M_SquadMarker") select 1) - _yoffset)]];
		_marker setMarkerShape "ICON";  
		_marker setMarkerType _type;
		_marker setMarkerText _text
};


//remove item
_var = _var - [_item];
TF47_FreqTracker_Logic setVariable ["TF47_FrequencyTracker",_var,true];
_ctrl lbDelete _curSel;




if (true) exitWith {};

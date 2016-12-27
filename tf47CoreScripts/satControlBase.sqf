/*
* Short Description
* 
* Long Description
* 
* Tested with :
* Arma 3 1.23
* 
* @category   Clientside & Serverside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @website	  http://taskforce47.de/
* @version    1.0
*/

if(isNil "cfgTF47") then {
	cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
};
private "_satConSlots";
waitUntil { !isNil "cfgTF47" };
call cfgTF47;

_playerSlot = format["%1", player];
_isAllowed = [_satConSlots, _playerSlot] call CBA_fnc_hashGet;

if(_isAllowed) then {
	[] execVM format["scripts\SatellitenBild.sqf"];
};
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
private "_pathToScripts";
waitUntil { !isNil "cfgTF47" };
call cfgTF47;

_this allowDamage false; 

_this addAction [("<t color=""#fadf3e"">" + ("Satellitenansicht") + "</t>"), format["%1satControlBase.sqf", _pathToScripts], []];  
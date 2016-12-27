/*
* Short Description
*
* Long Description
* 
* Tested with :
* Arma 3 1.23
* 
* @category   Clienside Serverside Scripts
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

_this setObjectTexture [0,'sign\smallTF47_20131030.paa']; 
_this allowDamage false; 

_this addAction [("<t color=""#faff3e"">" + ("Spawn Regular Tyre") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [tyrespawn, "ACE_Spare_Tyre", 0, "", "mil_dot", "ColorBlue", WEST, "", true, 300]];  
_this addAction [("<t color=""#fabf3e"">" + ("Spawn Heavy Duty Tyre") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [tyrespawn, "ACE_Spare_Tyre_HD", 0, "", "mil_dot", "ColorBlue", WEST, "", true, 300]];  
_this addAction [("<t color=""#fa6f3e"">" + ("Spawn APC Tyre") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [tyrespawn, "ACE_Spare_Tyre_HDAPC", 0, "", "mil_dot", "ColorBlue", WEST, "", true, 300]];  
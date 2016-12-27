/*
* Activate and deactivate LEA
*  
* Long description for file (if any)...
* 
* Tested with :
* Arma 3 1.23
*
* @category   Clientside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @author     [TF47] meat
* @website	  http://taskforce47.de/
* @version    1.0
*/

if(isNil "cfgTF47") then {
	cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
};
_activatelea = _this select 0;

if(TF47LEA_MODACTIVE) then {
	if(_activatelea) then {
		hint parseText format["@LEA ist jetzt <t color=""#88FF88"">aktiv</t><br/>@LEA is now <t color=""#88FF88"">active</t>"];
		enable_tf47lea = true;
	} else {
		hint parseText format["@LEA ist jetzt <t color=""#FF8888"">deaktiviert</t><br/>@LEA is now <t color=""#FF8888"">deactivated</t>"];
		enable_tf47lea = false;
	};
};

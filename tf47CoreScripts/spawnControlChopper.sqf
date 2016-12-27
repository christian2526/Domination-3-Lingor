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

_this addAction [("<t color=""#faff3e"">" + ("Spawn BUTTERFLY (15 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "MH6J_EP1", 15, "BUTTERFLY", "b_air", "ColorBrown", WEST, "rottrans"]];  
_this addAction [("<t color=""#faff3e"">" + ("Spawn CROW (20 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "MH60S", 20, "CROW", "b_air", "ColorBrown", WEST, "rottrans"]];  
_this addAction [("<t color=""#faff3e"">" + ("Spawn RAVEN (30 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "UH60M_EP1", 30, "RAVEN", "b_air", "ColorBrown", WEST, "rottrans"]];  
_this addAction [("<t color=""#faff3e"">" + ("Spawn DUSTOFF Medevac (30 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "UH60M_EP1", 30, "DUSTOFF", "b_air", "ColorRed", WEST, "rottrans"]];  
_this addAction [("<t color=""#faff3e"">" + ("Spawn GRIFFIN (30 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "UH1Y", 30, "GRIFFIN", "b_air", "ColorBrown", WEST, "rottrans"]];  
_this addAction [("<t color=""#faff3e"">" + ("Spawn PELICAN (20 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "CH_47F_EP1", 20, "PELICAN", "b_air", "ColorBrown", WEST, "rottrans"]];  
_this addAction [("<t color=""#faff3e"">" + ("Spawn GOOSE (30 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "MV22", 30, "GOOSE", "b_air", "ColorBrown", WEST, "rottrans"]];  

_this addAction [("<t color=""#fabf3e"">" + ("Spawn ALBATROS (60 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "ACE_HC130_N", 60, "ALBATROS", "b_plane", "ColorBrown", WEST, "fixwng"]];  

_this addAction [("<t color=""#fa6f3e"">" + ("Spawn DRAGON (25 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "AH64D_EP1", 25, "DRAGON", "b_air", "ColorOrange", WEST, "rotatk"]];  
_this addAction [("<t color=""#fa6f3e"">" + ("Spawn MANTICORE (25 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "AH1Z", 25, "MANTICORE", "b_air", "ColorOrange", WEST, "rotatk"]];  
_this addAction [("<t color=""#fa6f3e"">" + ("Spawn FIREFLY (15 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "AH6J_EP1", 15, "FIREFLY", "b_air", "ColorOrange", WEST, "rotatk"]];  

//_this addAction [("<t color=""#fa2f3e"">" + ("Spawn A2A WASP (30 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "AV8B2", 25, "WASP", "b_plane", "ColorOrange", WEST, "fixatk"]];  
//_this addAction [("<t color=""#fa2f3e"">" + ("Spawn THUNDERBIRD (40 Tickets)") + "</t>"), format["%1spawnBase.sqf", _pathToScripts], [helipad_spawn, "ACE_A10_Mk82", 25, "THUNDERBIRD", "b_plane", "ColorOrange", WEST, "fixatk"]];  
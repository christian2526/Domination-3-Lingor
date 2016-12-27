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

_flag = _this select 0; // Object that had the Action (also _target in the addAction command)
_player = _this select 1; // Unit that used the Action (also _this in the addAction command)
_actID = _this select 2; // ID of the Action

_spawn = (_this select 3) select 0;
_vehClass = (_this select 3) select 1;
_vehTickets = (_this select 3) select 2;

_markertext = if (count (_this select 3) > 3) then {(_this select 3) select 3} else { " " };
_markertype = if (count (_this select 3) > 4) then {(_this select 3) select 4} else { "b_air" };
_markercolor = "ColorWhite";
_markerside = if (count (_this select 3) > 6) then {(_this select 3) select 6} else { WEST };

_licencetype = if (count (_this select 3) > 7) then {(_this select 3) select 7} else { "" };

_ignorespawnscripts = if (count (_this select 3) > 8) then {(_this select 3) select 8} else { false };
_sleep = if (count (_this select 3) > 9) then {(_this select 3) select 9} else { 0 };


if (count (_this select 3) > 5) then {
	_markercolor = (_this select 3) select 5;
} else {
	_markercolor = "ColorRed";
	if (_markerside == WEST) then {
		_markercolor = "ColorBlue";
	};
	if (_markerside == RESISTANCE) then {
		_markercolor = "ColorYellow";
	};
};
_markerdespawn = 300;

_isallowed = true;
if(_vehTickets > 0) then {
	_isallowed = false;

	_uid = "7412934";
	if(isMultiplayer) then {
		_uid = getPlayerUID _player;
	};

	["tf47_checklist", [_player, _uid, 4]] call CBA_fnc_globalEvent;
	_chtime = time + 60;
	while {isNil("TF47ChecklistResult") && (_chtime > time)} do {
		// Wait for CheckList Result
		sleep 0.001;
	};
	if(!isNil("TF47ChecklistResult")) then {
		_isOnList = TF47ChecklistResult;
		TF47ChecklistResult = nil;

		if (_isOnList) then {
			_isallowed = true;
		};
	};
};

if (isMultiplayer && !_isallowed) then {
	hint "Nur [TF47] Spieler mit der noetigen Berechtigung koennen Fahrzeuge spawnen";

} else {
	if(_spawn getVariable["spawnBlocked", false]) then {
		hint "Dieses Terminal ist momentan ausser Betrieb. Bitte versuche es spaeter erneut.";

	} else {
		_spawn setVariable["spawnBlocked", true, true];

		_Object = _vehClass;
		_StartPos = _spawn;
		_Azimut = getDir _spawn;
		_vehicle = _Object createVehicle position _StartPos;
		_vehicle setDir _Azimut;
		_vehicle setFuel 1;

		_ticketcomment = format ["%1 (%2)", _vehClass, name _player];
		if (_markertext != " ") then {
			_ticketcomment = format ["[%1] %2 (%3)", _markertext, _vehClass, name _player];
		};

		if(_vehTickets > 0) then {
			["tf47_changetickets", [WEST, 3, _vehTickets, _ticketcomment]] call CBA_fnc_globalEvent;
		};

		if(!_ignorespawnscripts) then {
			// TODO:
			//_vehicle setVehicleInit format ["[%1, ""%2""] execVM ""%3vehicleOnSpawn.sqf""", "this", _licencetype, _pathToScripts];
			//processInitCommands;
			// FIX (TODO):
			[[_vehicle, _licencetype] "tf47_fnc_vehicleOnSpawn", true, true] spawn BIS_fnc_MP;
			//[_vehicle, _licencetype] execVM format["%1vehicleOnSpawn.sqf", _pathToScripts];

			if (_markertext != "") then {
					// TODO:
					//_vehicle setVehicleInit format ["[%1, ""%2"", ""%3"", %4, ""%5"", %6] execVM ""%7unitMarkerInit.sqf"";", "this", _markertext, _markertype, _markerside, _markercolor, _markerdespawn, _pathToScripts];
					//processInitCommands;
					// FIX:
					[[_vehicle, _markertext, _markertype, _markerside, _markercolor, _markerdespawn], "tf47_fnc_unitMarkerInit", true, true] spawn BIS_fnc_MP;
			};
		};

		if(_sleep > 0) then {
			sleep _sleep;
		};

		_spawn setVariable["spawnBlocked", false, true];
	};
};
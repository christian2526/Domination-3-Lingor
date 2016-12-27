// by Xeno
//#define __DEBUG__
#define THIS_FILE "init.sqf"
#include "x_setup.sqf"
diag_log [diag_frameno, diag_ticktime, time, "Executing Dom init.sqf"];

d_IS_HC_CLIENT = !isDedicated && {!hasInterface};
__TRACE_1("","d_IS_HC_CLIENT")

if (isDedicated) then {disableRemoteSensors true};

if (isMultiplayer && {!isDedicated}) then {
	enableRadio false;
	showChat false;
	0 fadeSound 0;
	titleText ["", "BLACK FADED"];
};

enableSaving [false,false];
enableTeamSwitch false;

d_of_ex_id = addMissionEventhandler ["EachFrame", {
	if (isNil "d_init_processed") then {
		call compile preprocessFileLineNumbers "d_init.sqf";
	};
	removeMissionEventHandler ["EachFrame", d_of_ex_id];
	d_of_ex_id = nil;
}];

waitUntil { isServer || !isNull player };
cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
private "_pathToScripts";
call cfgTF47;

tf47_fnc_vehicleOnEnter 	= compileFinal preprocessFileLineNumbers format ["%1vehicleOnEnter.sqf", _pathToScripts];
tf47_fnc_unitMarkerInit 	= compileFinal preprocessFileLineNumbers format ["%1unitMarkerInit.sqf", _pathToScripts];
tf47_fnc_vehicleOnSpawn 	= compileFinal preprocessFileLineNumbers format ["%1vehicleOnSpawn.sqf", _pathToScripts];


// client event handler
execVM format ["%1playerEvents.sqf", _pathToScripts];

// DB Functionality & Ticket System
execVM format ["%1serverEvents.sqf", _pathToScripts];

// Special Markers
execVM format ["%1mapMarkerInit.sqf", _pathToScripts];

diag_log [diag_frameno, diag_ticktime, time, "Dom init.sqf processed"];

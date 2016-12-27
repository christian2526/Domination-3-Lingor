/////////////////////////////////////////////////////////////////////////////////////////////////////
#define MSG_TOO_MANY_OPFOR "Es gibt zu schon genügend Opfor im Vergleich zu Blufor. Du wirst deshalb in 10 Sekunden zurück in die Lobby versetzt!"
////////////////////////////////////////////////////////////////////////////////////////////////////

private ["_player","_opfor","_blufor"];

_player = _this select 0;

if (side _player != east) exitWith {true};
if (side _player == civilian) exitWith {true};
if (side _player == west) exitWith {true};

_blufor = playersNumber west;
_opfor = playersNumber east;


IF ((_blufor < 18) or (_blufor / 6) < _opfor) THEN {
	if (player == _player) then {
		titleText [MSG_TOO_MANY_OPFOR,"BLACK"];
		sleep 10;
		(findDisplay 46) closeDisplay 1;
	};
};


if (true) exitWith {};
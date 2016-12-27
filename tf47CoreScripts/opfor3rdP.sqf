private ["_player"];

_player = _this select 0;

if (side _player != east) exitWith {true};
if (side _player == civilian) exitWith {true};
if (side _player == west) exitWith {true};

[_player]spawn{ 
	_player = _this select 0;
    while {true} do { 
        waitUntil{ 
                sleep 0.1;
                cameraOn == _player && cameraView == "External" 
            };  
        _player switchCamera "Internal"; 
        }; 
};  
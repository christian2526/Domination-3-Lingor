/*
* Handles LEA
* Loadout Editor For ArmA 2 Combined Operation & ACE 2
* 
* Tested with :
* Arma 3 1.23
* LEA User-Addon v1.6
* 
* @category   Clientside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @author     Creators of Loadout Editor For ArmA 2 Combined Operation & ACE 2 
* @website	  http://taskforce47.de/
* @version    1.0
*/

lea_addon_unlocked = true;
enable_lea_addon = false;
if (!isServer && (player != player)) then {
   waitUntil {player == player};
};

TF47LEA_MODACTIVE = false;
waitUntil { !isNil "LEA_Lock" };
TF47LEA_MODACTIVE = true;

enable_tf47lea = false;
TF47LEA_Lock = true;
TF47LEA_Action = -1;

[] spawn {
	_lastveh = player;
	_lastcorps = player;
	_id = 0;
	_time = 0;
	_pos0 = getPos player;
	
	while {TF47LEA_MODACTIVE} do {
		if (lea_addon_unlocked) then {
			TF47LEA_Lock = false;
		};
		
		if (enable_tf47lea) then {
			
			if(TF47LEA_Action < 0) then {
				TF47LEA_Action = player addaction [("<t color=""#fabf3e"">" + "Apply @LEA loadout" + "</t>"),"userconfig\lea\loadout.sqf","",0,false,false];				
			};
			
			//switch body or respawn
			if (player != _lastcorps) then {
				_lastcorps = player;
				_time = 0;
				if(TF47LEA_Action < 0) then {
					TF47LEA_Action = player addaction [("<t color=""#fabf3e"">" + "Apply @LEA loadout" + "</t>"),"userconfig\lea\loadout.sqf","",0,false,false];
				};
			};
			
			if (isMultiplayer) then{
				// player reconnected
				if (_time==0 && (player getVariable ["lea_already_connected", false])) then{
					player removeaction TF47LEA_Action;
					TF47LEA_Action = -1;
				};
				
				_time = _time + 1;
				
				_pos = getPos player;
				_posX = abs (_pos select 0);
				_posY = abs (_pos select 1);
				_pos0X = abs (_pos0 select 0);
				_pos0Y = abs (_pos0 select 1);
				_deltaX = abs (_pos0X - _posX);
				_deltaY = abs (_pos0Y - _posY);

				if ((_deltaX<100) and (_deltaY<100)) then {
					_time = _time - 1;
				};
			};
			
		} else {
			player removeAction TF47LEA_Action;
			TF47LEA_Action = -1;
		};
		
		sleep 1;
	};
};
/*
Author: Chris [TF47]
Requiers: Object named Habor and Trigger on the same position as Habor
Trigger:
  Condition: "Ship" countType thislist  > 0;
  OnAct: nul = [thislist,30,1] execVM "vehicleservice\vehicleServiceHabor.sqf";
param1 = no change
param2 = distance to habor
param3 = loadouts yes/no 1=yes 0=no
*/

_thislist = _this select 0;
_distancetoHabor = _this select 1;
_addLoadouts = _this select 2;
{
    _x setVariable ["tf47service", true, true];
} forEach _thislist;


{
  _ship = _x;
    if (_ship getVariable ["tf47service", false]) then {
      _respawnactive = false;
      if (_ship getVariable ["RespawnSystemActive", false]) then {
        _respawnactive = true;
      };

      _shipServ1 = 0;
      _shipServ2 = 0;
      _shipServ3 = 0;
      _shipServ99 = 0;

      _shipServ1 = _ship addAction [("<t color=""#fa8f3e"">" + ("Repair Vehicle") + "</t>"), "vehicleService\vehicleRepairSubroutine.sqf", [_ship]];
    	_shipServ2 = _ship addAction [("<t color=""#fa8f3e"">" + ("Refuel Vehicle") + "</t>"), "vehicleService\vehicleRefuelSubroutine.sqf", [_ship]];
    	_shipServ3 = _ship addAction [("<t color=""#fa8f3e"">" + ("Rearm Vehicle") + "</t>"), "vehicleService\vehicleAmmoSubroutine.sqf", [_ship]];

      if (_addLoadouts == 1) then {
        _shipServ4 = 0;

        _shipServ4 addAction [("<t color=""#fadf3e"">" + ("Loadout: Boat Infantry") + "</t>"), "vehicleService\vehicleLoadoutSubroutine.sqf", [_ship, "BoatInf"]];
      };


      if (_respawnactive) then {
        _shipServ99 = _ship addAction [("<t color=""#fa4f3e"">" + ("Respawn Vehicle") + "</t>"), "vehicleService\vehicleRespawnSubroutine.sqf", [_ship]];
      };

      while {((_ship distance2D habor) < _distancetoHabor)} do {sleep 5;};

      _ship removeaction _shipServ1;
      _ship removeaction _shipServ2;
      _ship removeaction _shipServ3;
      _ship removeaction _shipServ99;
      if (_addLoadouts == 1) then {_ship removeAction _shipServ4};
    };
} forEach _thislist;

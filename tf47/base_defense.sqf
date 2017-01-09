//Setup Base Def
private ["_veh","_reloadTime"];

_veh = _this select 0;
_reloadTime = _this select 1;

createVehicleCrew _veh;
sleep 2;
_crewveh = crew _veh;

{
	_x allowCrewInImmobile true;
	_x setBehaviour "careless";
	_x allowFleeing 0;
	_x disableAI "MOVE";
} forEach _crewveh;

while {alive _veh} do {
	_veh setVehicleAmmo 1;
	_veh setFuel 0;
	_veh forceSpeed 0;
	_veh engineOn false;
	sleep _reloadTime;
};

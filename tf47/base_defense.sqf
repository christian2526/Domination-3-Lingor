//Setup Base Def
private ["_aabase","_reloadTime"];

_aabase = _this select 0;
_reloadTime = _this select 1;

createVehicleCrew _aabase;

while {alive _aabase} do {
	_aabase setVehicleAmmo 1;
	_aabase setFuel 0;
	_aabase forceSpeed 0;
	_aabase engineOn false;
	sleep _reloadTime;
};

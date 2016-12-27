_unit = _this select 0;

_playerweap = [
	"ACE_SOC_M4A1_Eotech_F",
	"ACRE_PRC117F",
	"ACE_P226",
	"ACE_Rangefinder_OD",
	"NVGoggles",
	"ItemCompass",
	"ACE_DAGR",
	"ACE_Earplugs",
	"ItemGPS",
	"ACE_Map",
	"ItemWatch"
 ];

_playerammo = [
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag",
	"SmokeShell",
	"SmokeShell",
	"ACE_15Rnd_9x19_P226",
	"ACE_15Rnd_9x19_P226",
	"ACE_Epinephrine",
	"ACE_Morphine",
	"ACE_Medkit",
	"ACE_LargeBandage",
	"ACE_LargeBandage",
	"ACE_LargeBandage",
	"ACE_LargeBandage",
	"ACE_Bandage",
	"ACE_Tourniquet"
 ];

{_unit addMagazine _x} foreach _playerammo;
{_unit addWeapon _x} foreach _playerweap;

[_unit, "ACE_CharliePack_Multicam"] call ACE_fnc_AddWeaponOnBack;

[player, "ACRE_PRC343", 1] call ACE_fnc_PackWeapon;
[player, "ACRE_PRC152", 1] call ACE_fnc_PackWeapon;
[player, "ACRE_PRC148", 1] call ACE_fnc_PackWeapon;

_unit selectWeapon (primaryWeapon _unit);
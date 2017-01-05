_veh = _this select 0;
_veh setVariable ["loadoutName", "Anti Tank Loadout", true];
//Clear Cargo
clearItemCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;


_veh addItemCargoGlobal ["ACE_EarPlugs",4];
_veh addWeaponCargoGlobal ["ACE_Vector",2];
_veh addWeaponCargoGlobal ["Binocular",2];
_veh addMagazineCargoGlobal ["SmokeShellGreen",5];
_veh addMagazineCargoGlobal ["SmokeShellRed",5];
_veh addMagazineCargoGlobal ["SmokeShell",10];
//_veh addMagazineCargoGlobal["Medikit",1];

_veh addBackpackCargoGlobal ["BIS_Steerable_Parachute",10];
_veh addWeaponCargoGlobal ["rhs_weap_m4_carryhandle",3];
_veh addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag",20];
_veh addWeaponCargoGlobal ["rhs_weap_fim92", 1];
_veh addMagazineCargoGlobal ["rhs_fim92_mag",2];
_veh addMagazineCargoGlobal ["tf47_m3maaws_heat", 8];
_veh addMagazineCargoGlobal ["tf47_m3maaws_he", 2];
_veh addWeaponCargoGlobal ["tf47_m3_maaws",1];
_veh addItemCargoGlobal ["tf47_optic_m3maaws", 2];
_veh addWeaponCargoGlobal ["tf47_at4_heat",4];
// Radios

_veh addItemCargoGlobal ["tf_rt1523g",1];
_veh addItemCargoGlobal ["tf_anprc152",6];

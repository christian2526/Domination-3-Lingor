_veh = _this select 0;
_veh setVariable ["loadoutName", "Mortar Loadout", true];
//Clear Cargo
clearItemCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;

//Grenades
_veh addMagazineCargoGlobal ["SmokeShell",3];
_veh addMagazineCargoGlobal ["SmokeShellGreen",3];
_veh addMagazineCargoGlobal ["SmokeShellRed",3];
_veh addMagazineCargoGlobal ["SmokeShellBLue",3];
_veh addMagazineCargoGlobal ["HandGrenade_West",5];

//Items
_veh addItemCargoGlobal ["ACE_EarPlugs",5];
_veh addItemCargoGlobal ["ACE_MapTools",5];
_veh addItemCargoGlobal ["ACE_RangeTable_82mm",2];
_veh addItemCargoGlobal ["ACE_microDAGR",3];
_veh addItemCargoGlobal ["ACE_RangeCard",3];
_veh addWeaponCargoGlobal ["ACE_Vector",3];

//Mortar
_veh addBackpackCargoGlobal ["B_Mortar_01_weapon_F",1];
_veh addBackpackCargoGlobal ["B_Mortar_01_support_F",1];

// Weapons + Ammo

//Items
_veh addItemCargoGlobal ["rhsusf_ANPVS_15",2];
//Weapons
_veh addWeaponCargoGlobal ["rhs_weap_m4a1_carryhandle",2];
_veh addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag",15];

// Radios

_veh addItemCargoGlobal ["tf_rt1523g",1];
_veh addItemCargoGlobal ["tf_anprc152",6];

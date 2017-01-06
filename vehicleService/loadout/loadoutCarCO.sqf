_veh = _this select 0;
_veh setVariable ["loadoutName", "Combined Operations Loadout", true];
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
_veh addMagazineCargoGlobal ["HandGrenade",5];

//Items
_veh addItemCargoGlobal ["ACE_EarPlugs",10];

//Medic
_veh addItemCargoGlobal ["ACE_fieldDressing",20];
_veh addItemCargoGlobal ["ACE_elasticBandage",20];
_veh addItemCargoGlobal ["ACE_quikclot",20];
_veh addItemCargoGlobal ["ACE_tourniquet",10];
_veh addItemCargoGlobal ["ACE_packingBandage",15];
//Injectors
_veh addItemCargoGlobal ["ACE_morphine",10];
_veh addItemCargoGlobal ["ACE_atropine",10];
_veh addItemCargoGlobal ["ACE_epinephrine",10];

// Weapons + Ammo
//Items
_veh addItemCargoGlobal ["rhsusf_ANPVS_15",2];
// Weapons
_veh addWeaponCargoGlobal ["rhs_weap_m4a1_carryhandle",2];
_veh addWeaponCargoGlobal ["rhs_weap_m16a4_carryhandle",1];
_veh addWeaponCargoGlobal ["rhs_weap_m16a4_carryhandle_M203",1];

// Ammo
_veh addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag",30];
_veh addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];

// Launcher
_veh addWeaponCargoGlobal ["rhs_weap_fim92",1];
_veh addWeaponCargoGlobal ["rhs_weap_fgm148", 1];
_veh addWeaponCargoGlobal ["tf47_at4_heat",4];

_veh addWeaponCargoGlobal ["tf47_m3maaws",4];
_veh addItemCargoGlobal ["tf47_optic_m3maaws", 4];
// Launcher Ammo
_veh addMagazineCargoGlobal ["rhs_fgm148_magazine_AT",2];
_veh addMagazineCargoGlobal ["rhs_fim92_mag",1];
_veh addMagazineCargoGlobal ["tf47_m3maaws_heat", 12];
_veh addMagazineCargoGlobal ["tf47_m3maaws_he", 4];


// Radios

_veh addItemCargoGlobal ["tf_rt1523g",1];
_veh addItemCargoGlobal ["tf_anprc152",6];

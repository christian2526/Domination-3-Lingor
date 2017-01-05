_veh = _this select 0;
_veh setVariable ["loadoutName", "Infantry Loadout", true];
//Clear Cargo
clearItemCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;

//Medic
_veh addItemCargoGlobal ["ACE_fieldDressing",10];
_veh addItemCargoGlobal ["ACE_packingBandage",10];
_veh addItemCargoGlobal ["ACE_elasticBandage",10];
_veh addItemCargoGlobal ["ACE_salineIV_500",4];
_veh addItemCargoGlobal ["ACE_tourniquet", 4];
_veh addItemCargoGlobal ["ACE_morphine",5];
_veh addItemCargoGlobal ["ACE_epinephrine",5];

//Grenades
_veh addMagazineCargoGlobal ["SmokeShell",8];
_veh addMagazineCargoGlobal ["SmokeShellGreen",3];
_veh addMagazineCargoGlobal ["SmokeShellRed",3];
_veh addMagazineCargoGlobal ["SmokeShellBLue",2];

_veh addItemCargoGlobal ["ItemRadio",2];
_veh addItemCargoGlobal ["ACE_Flashlight_XL50",4];

_veh addWeaponCargoGlobal ["ACE_Vector",1];
_veh addItemCargoGlobal ["B_UavTerminal",1];

//Items
_veh addItemCargoGlobal ["rhsusf_ANPVS_15",4];
// Weapons
_veh addWeaponCargoGlobal ["rhs_weap_m4a1_carryhandle",2];
_veh addWeaponCargoGlobal ["rhs_weap_m16a4_carryhandle",1];
_veh addWeaponCargoGlobal ["rhs_weap_m16a4_carryhandle_M203",1];

// Ammo
_veh addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag",30];
_veh addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",12];
_veh addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",8];
_veh addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell",8];
_veh addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",4];

// Attachments
_veh addItemCargoGlobal ["rhsusf_acc_eotech_552",2];
_veh addItemCargoGlobal ["rhsusf_acc_ACOG_USMC",2];
_veh addItemCargoGlobal ["rhsusf_acc_anpeq15",4];
_veh addItemCargoGlobal ["U_B_Wetsuit",6];
_veh addItemCargoGlobal ["V_RebreatherB",6];
_veh addItemCargoGlobal ["G_Diving",6];

// Launcher
_veh addWeaponCargoGlobal ["tf47_at4_heat",3];

// LMG
_veh addWeaponCargoGlobal ["rhs_weap_m249_pip_L",1];
_veh addMagazineCargoGlobal ["rhs_200rnd_556x45_T_SAW",4];
// Radios

_veh addItemCargoGlobal ["tf_rt1523g",1];
_veh addItemCargoGlobal ["tf_anprc152",6];

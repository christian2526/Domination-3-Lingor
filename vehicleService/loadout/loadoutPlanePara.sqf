_veh = _this select 0;
_veh setVariable ["loadoutName", "Paratrooper", true];
//Clear Cargo
clearItemCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;

//Grenades
_veh addMagazineCargoGlobal ["SmokeShell",10];
_veh addMagazineCargoGlobal ["SmokeShellGreen",10];
_veh addMagazineCargoGlobal ["SmokeShellRed",10];
_veh addMagazineCargoGlobal ["SmokeShellBLue",10];

//Items
_veh addItemCargoGlobal ["ACE_EarPlugs",10];
_veh addItemCargoGlobal ["ACE_MapTools",2];
_veh addItemCargoGlobal ["ACE_microDAGR",2];
_veh addItemCargoGlobal ["ACE_Altimeter",10];

//Backpack
_veh addBackpackCargoGlobal ["ACE_NonSteerableParachute",10];
_veh addBackpackCargoGlobal ["ACE_ReserveParachute",10];
_veh addBackpackCargoGlobal ["BIS_Steerable_Parachute",10];

// Radios

_veh addItemCargoGlobal ["tf_rt1523g",1];
_veh addItemCargoGlobal ["tf_anprc152",6];

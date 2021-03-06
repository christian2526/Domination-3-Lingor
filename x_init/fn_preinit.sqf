// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_preinit.sqf"
#include "..\x_setup.sqf"
diag_log format ["############################# %1 #############################", missionName];
diag_log [diag_frameno, diag_ticktime, time, "Executing Dom fn_preinit.sqf"];

#ifndef __TT__
d_tt_ver = false;
#else
d_tt_ver = true;
#endif

#ifndef __TANOA__
d_tanoa = false;
#else
d_tanoa = true;
#endif

#ifdef __TANOATT__
d_tt_tanoa = true;
d_tanoa = true;
#else
d_tt_tanoa = false;
#endif

d_HeliHEmpty = "Land_HelipadEmpty_F";

// BLUFOR, OPFOR or INDEPENDENT for own side, setup in x_setup.sqf
#ifdef __OWN_SIDE_BLUFOR__
d_own_side = "WEST";
d_own_sides = ["WEST"];
d_enemy_side = "EAST";
d_enemy_side_short = "E";
#endif
#ifdef __OWN_SIDE_OPFOR__
d_own_side = "EAST";
d_own_sides = ["EAST"];
d_enemy_side = "WEST";
d_enemy_side_short = "W";
#endif
#ifdef __OWN_SIDE_INDEPENDENT__
d_own_side = "GUER";
d_own_sides = ["GUER"];
d_enemy_side = "EAST";
d_enemy_side_short = "E";
#endif
#ifdef __TT__
d_own_side = "WEST";
d_own_sides = ["WEST"];
d_enemy_side = "GUER";
d_enemy_side_short = "G";
#endif

d_side_enemy = call {
	if (d_enemy_side_short == "E") exitWith {opfor};
	if (d_enemy_side_short == "W") exitWith {blufor};
	if (d_enemy_side_short == "G") exitWith {independent};
};

d_side_player =
#ifdef __OWN_SIDE_OPFOR__
	opfor;
#endif
#ifdef __OWN_SIDE_BLUFOR__
	blufor;
#endif
#ifdef __OWN_SIDE_INDEPENDENT__
	independent;
#endif
#ifdef __TT__
	blufor;
#endif

d_version_string =
#ifdef __OWN_SIDE_OPFOR__
	"Opfor";
#endif
#ifdef __OWN_SIDE_BLUFOR__
	"Blufor";
#endif
#ifdef __OWN_SIDE_INDEPENDENT__
	"GUER";
#endif
#ifdef __TT__
	"Two Teams";
#endif

d_e_marker_color =
#ifdef __OWN_SIDE_OPFOR__
	"ColorBLUFOR";
#endif
#ifdef __OWN_SIDE_BLUFOR__
	"ColorOPFOR";
#endif
#ifdef __OWN_SIDE_INDEPENDENT__
	"ColorGUER";
#endif
#ifdef __TT__
	"ColorYellow";
#endif

#ifdef __ALTIS__
#include "x_sm_bonus_vec_ar_altis.sqf"
#endif
#ifdef __CUP_CHERNARUS__
#include "x_sm_bonus_vec_ar_cup.sqf"
#endif
#ifdef __CUP_TAKISTAN__
#include "x_sm_bonus_vec_ar_cup.sqf"
#endif
#ifdef __CUP_SARA__
#include "x_sm_bonus_vec_ar_cup.sqf"
#endif
#ifdef __TT__
if (!d_tt_tanoa) then {
#include "x_sm_bonus_vec_ar_tt.sqf"
} else {
#include "x_sm_bonus_vec_ar_tt_tanoa.sqf"
};
#endif
#ifdef __TANOA__
#include "x_sm_bonus_vec_ar_tanoa.sqf"
#endif
#ifdef __STRATIS__
#include "x_sm_bonus_vec_ar_altis.sqf"
#endif

#ifdef __ALTIS__
#include "x_mt_bonus_vec_ar_altis.sqf"
#endif
#ifdef __CUP_CHERNARUS__
#include "x_mt_bonus_vec_ar_cup.sqf"
#endif
#ifdef __CUP_TAKISTAN__
#include "x_mt_bonus_vec_ar_cup.sqf"
#endif
#ifdef __CUP_SARA__
#include "x_mt_bonus_vec_ar_cup.sqf"
#endif
#ifdef __TT__
if (!d_tt_tanoa) then {
#include "x_mt_bonus_vec_ar_tt.sqf"
} else {
#include "x_mt_bonus_vec_ar_tt_tanoa.sqf"
};
#endif
#ifdef __TANOA__
#include "x_mt_bonus_vec_ar_tanoa.sqf"
#endif
#ifdef __STRATIS__
#include "x_mt_bonus_vec_ar_altis.sqf"
#endif

#ifndef __TT__
d_sm_bonus_vehicle_array = d_sm_bonus_vehicle_array apply {toUpper _x};
d_mt_bonus_vehicle_array = d_mt_bonus_vehicle_array apply {toUpper _x};
// these vehicles can be lifted by the wreck lift chopper (previous chopper 4), but only, if they are completely destroyed
d_heli_wreck_lift_types = d_sm_bonus_vehicle_array + d_mt_bonus_vehicle_array;
#else
d_sm_bonus_vehicle_array set [0, (d_sm_bonus_vehicle_array select 0) apply {toUpper _x}];
d_sm_bonus_vehicle_array set [1, (d_sm_bonus_vehicle_array select 1) apply {toUpper _x}];
d_mt_bonus_vehicle_array set [0, (d_mt_bonus_vehicle_array select 0) apply {toUpper _x}];
d_mt_bonus_vehicle_array set [1, (d_mt_bonus_vehicle_array select 1) apply {toUpper _x}];

d_heli_wreck_lift_types = (d_sm_bonus_vehicle_array select 0) + (d_sm_bonus_vehicle_array select 1) + (d_mt_bonus_vehicle_array select 0) + (d_mt_bonus_vehicle_array select 1);
#endif

d_x_drop_array =
#ifdef __OWN_SIDE_INDEPENDENT__
	[[], [localize "STR_DOM_MISSIONSTRING_22", "I_MRAP_03_F"], [localize "STR_DOM_MISSIONSTRING_20", "Box_IND_Ammo_F"]];
#endif
#ifdef __OWN_SIDE_BLUFOR__
	[[], [localize "STR_DOM_MISSIONSTRING_22", ["B_MRAP_01_F", "B_T_LSV_01_unarmed_F"] select d_tanoa], [localize "STR_DOM_MISSIONSTRING_20", "Box_NATO_Ammo_F"]];
#endif
#ifdef __OWN_SIDE_OPFOR__
	[[], [localize "STR_DOM_MISSIONSTRING_22", ["O_MRAP_02_F", "O_T_LSV_02_unarmed_F"] select d_tanoa], [localize "STR_DOM_MISSIONSTRING_20", "Box_East_Ammo_F"]];
#endif
#ifdef __TT__
	[[], [], []];
#endif

// side of the pilot that will fly the drop air vehicle
d_drop_side = d_own_side;

// d_jumpflag_vec = empty ("") means normal jump flags for HALO jump get created
// if you add a vehicle typename to d_jumpflag_vec (d_jumpflag_vec = "B_Quadbike_01_F"; for example) only a vehicle gets created and no HALO jump is available
//d_jumpflag_vec = "B_Quadbike_01_F";
d_jumpflag_vec = "";

// please note, player string names are case sensitive! You have to use exactly the same case as in the editor here!
#ifndef __TT__
d_player_entities = [

//USMC Infantry 48
"a1","a2","a3","a4",
"b1","b2","b3","b4",
"c1","c2","c3","c4",
"d1","d2","d3","d4",
"e1","e2","e3","e4",
"f1","f2","f3","f4",
"g1","g2","g3","g4",
"h1","h2","h3","h4",
"a1_1","a2_1","a3_1","a4_1",
"b1_1","b2","b3_1","b4_1",
"c1_1","c2_1","c3_1","c4_1",
"d1_1","d2_1","d3_1","d4_1",
//Sniper
"snp1","snp2",
//Command and Control
"gbc1","gbc2","jtac1","jtac2","tower","jfo",
//Armor Crew
"armor11","armor12","armor13","armor14",
"armor21","armor22","armor23","armor24",
"armor31","armor32","armor33","armor34",
//Medevac Crew
"sar11","sar12",
"sar13","sar14",
"sar15","sar16",

"sar21","sar22",
"sar23","sar24",
//Rotary Wing Transport
"rwrt11","rwrt12","rwrt13","rwrt14",
"rwrt21","rwrt22","rwrt23","rwrt24",
//Rortary Wing Attack
"rwa11","rwa12",
//Fixed Wing Attack
"fixwa11","fixwa12","fixwa13","fixwa14"

];
#else
d_entities_tt_blufor = [];

d_entities_tt_opfor = [];
#endif

d_servicepoint_building = "Land_Cargo_House_V2_F";

d_illum_tower = "Land_TTowerBig_2_F";
d_wcamp = "Land_BagBunker_Large_F";

d_mash = "Land_TentDome_F";
d_mash_flag = "Flag_RedCrystal_F";

d_dropped_box_marker = "mil_marker";

d_strongpointmarker = "mil_objective";

d_flag_str_blufor = "\a3\data_f\flags\flag_blue_co.paa";
d_flag_str_opfor = "\a3\data_f\flags\flag_red_co.paa";
d_flag_str_independent = "\a3\data_f\flags\flag_green_co.paa";

d_SlopeObject = "Logic" createVehicleLocal [0,0,0];

d_cargo_chute =
#ifdef __OWN_SIDE_BLUFOR__
	"B_Parachute_02_F";
#endif
#ifdef __OWN_SIDE_OPFOR__
	"O_Parachute_02_F";
#endif
#ifdef __OWN_SIDE_INDEPENDENT__
	"I_Parachute_02_F";
#endif
#ifdef __TT__
	"I_Parachute_02_F";
#endif

d_flag_pole = "FlagPole_F";

d_vec_camo_net =
#ifdef __OWN_SIDE_OPFOR__
	"CamoNet_OPFOR_big_F";
#endif
#ifdef __OWN_SIDE_BLUFOR__
	"CamoNet_BLUFOR_big_F";
#endif
#ifdef __OWN_SIDE_INDEPENDENT__
	"CamoNet_INDP_big_F";
#endif
#ifdef __TT__
	"CamoNet_INDP_big_F";
#endif

// internal
d_sm_winner = 0;
d_objectID1 = objNull;
d_objectID2 = objNull;

// no farps in A3 so we fake them
// first entry should always be a helipad because the trigger which is needed to make it work is spawned there
// second object is also needed, remove action gets added on the second object
d_farp_classes = ["Land_HelipadSquare_F", "Land_Cargo40_military_green_F"];

// artillery operators
#ifndef __TT__
d_can_use_artillery = []; // case has to be the same as in mission.sqm, d_artop_1 D_ARTOP_1 is not the same :)
#else
d_can_use_artillery = [];
#endif

// those units can mark artillery targets but can not call in artillery strikes (only d_can_use_artillery can call in artillery strikes and also mark arty targets)
#ifndef __TT__
d_can_mark_artillery = [];
#else
d_can_mark_artillery = [];
#endif

#ifndef __TT__
d_can_call_cas = [];
#else
d_can_call_cas = [];
#endif

d_arty_m_marker =
#ifdef __OWN_SIDE_OPFOR__
	"o_art";
#endif
#ifdef __OWN_SIDE_BLUFOR__
	"b_art";
#endif
#ifdef __OWN_SIDE_INDEPENDENT__
	"n_art";
#endif
#ifdef __TT__
	"n_art";
#endif

d_color_m_marker =
#ifdef __OWN_SIDE_OPFOR__
	"ColorEAST";
#endif
#ifdef __OWN_SIDE_BLUFOR__
	"ColorWEST";
#endif
#ifdef __OWN_SIDE_INDEPENDENT__
	"ColorGUER";
#endif
#ifdef __TT__
	"ColorGUER";
#endif

#ifdef __TT__
d_tt_points = [
	30, // points for the main target winner team
	7, // points if draw (main target)
	15, // points for destroying main target radio tower
	5, // points for main target mission
	10, // points for sidemission
	5, // points for capturing a camp (main target)
	10, // points that get subtracted when loosing a mt camp again
	4, // points for destroying a vehicle of the other team
	2 // points for killing a member of the other team
];
#endif

d_cas_available_time = 600; // time till CAS is available again!

d_non_steer_para = "NonSteerable_Parachute_F";

private _isserv_or_hc = isServer || {!isDedicated && {!hasInterface}};

if (_isserv_or_hc) then {
	__TRACE_1("","_isserv_or_hc")
	d_player_store = d_HeliHEmpty createVehicleLocal [0, 0, 0];
	d_placed_objs_store = d_HeliHEmpty createVehicleLocal [0, 0, 0];
	d_placed_objs_store2 = d_HeliHEmpty createVehicleLocal [0, 0, 0];
	d_placed_objs_store3 = d_HeliHEmpty createVehicleLocal [0, 0, 0];
};

if (isServer) then {
	d_with_ace = isClass (configFile>>"CfgPatches">>"ace_main");
	publicVariable "d_with_ace";
	call compile preprocessFileLineNumbers "x_init\x_initcommon.sqf";
};

if (_isserv_or_hc) then {
	if (isServer) then {
		if (d_weather == 0) then {
			0 setOvercast (random 1);
			if (d_enable_fog == 0) then {
				private _fog = if (random 100 > 90) then {
					[random 0.1, 0.1, 20 + (random 40)]
				} else {
					[0,0,0]
				};
				__TRACE_1("","_fog")
				0 setFog _fog;
			} else {
				0 setFog [0, 0, 0];
				0 spawn {
					sleep 100;
					0 setFog [0, 0, 0];
				};
			};
			forceWeatherChange;
			if (d_WithWinterWeather == 0) then {
				d_winterw = [0, [2, 1] select (rain <= 0.3)] select (overcast > 0.5);
				publicVariable "d_winterw";
			};
		} else {
			0 setFog [0, 0, 0];
			0 setOvercast 0;
			0 spawn {
				while {true} do {
					sleep 100;
					0 setOvercast 0;
					0 setFog [0, 0, 0];
				};
			};
		};

		if (d_timemultiplier > 1) then {
			setTimeMultiplier d_timemultiplier;
		};
	};

	// _E = Opfor
	// _W = Blufor
	// _G = Independent
	// this is what gets spawned
	d_allmen_E = [
#ifdef __ALTIS__
#include "d_allmen_O_default.sqf"
#endif
#ifdef __CUP_CHERNARUS__
#include "d_allmen_O_CUP_CHER.sqf"
#endif
#ifdef __CUP_TAKISTAN__
#include "d_allmen_O_CUP_TAKI.sqf"
#endif
#ifdef __CUP_SARA__
#include "d_allmen_O_CUP_SLA.sqf"
#endif
#ifdef __TT__
if (!d_tt_tanoa) then {
#include "d_allmen_O_default.sqf"
} else {
#include "d_allmen_O_tanoa.sqf"
}
#endif
#ifdef __TANOA__
#include "d_allmen_O_tanoa.sqf"
#endif
#ifdef __STRATIS__
#include "d_allmen_O_default.sqf"
#endif
	];
	d_allmen_W = [
		#include "d_allmen_B_default.sqf"
	];
	d_allmen_G = [
		#include "d_allmen_G_default.sqf"
	];

	d_specops_E = [
#ifdef __ALTIS__
#include "d_specops_O_default.sqf"
#endif
#ifdef __CUP_CHERNARUS__
#include "d_specops_O_CUP_CHER.sqf"
#endif
#ifdef __CUP_TAKISTAN__
#include "d_specops_O_CUP_TAKI.sqf"
#endif
#ifdef __CUP_SARA__
#include "d_specops_O_CUP_SLA.sqf"
#endif
#ifdef __TT__
if (!d_tt_tanoa) then {
#include "d_specops_O_default.sqf"
} else {
#include "d_specops_O_tanoa.sqf"
}
#endif
#ifdef __TANOA__
#include "d_specops_O_tanoa.sqf"
#endif
#ifdef __STRATIS__
#include "d_specops_O_default.sqf"
#endif
	];
	d_specops_W = [["West","BLU_F","Infantry","BUS_ReconTeam"] call d_fnc_GetConfigGroup];
	d_specops_G = [["I_G_Soldier_exp_F", "I_Soldier_exp_F", "I_G_Soldier_GL_F", "I_G_medic_F"]];

	d_veh_a_E = [
#ifdef __ALTIS__
#include "d_veh_a_O_default.sqf"
#endif
#ifdef __CUP_CHERNARUS__
#include "d_veh_a_O_CUP_CHER.sqf"
#endif
#ifdef __CUP_TAKISTAN__
#include "d_veh_a_O_CUP_TAKI.sqf"
#endif
#ifdef __CUP_SARA__
#include "d_veh_a_O_CUP_SARA.sqf"
#endif
#ifdef __TT__
if (!d_tt_tanoa) then {
#include "d_veh_a_O_default.sqf"
} else {
#include "d_veh_a_O_tanoa.sqf"
}
#endif
#ifdef __TANOA__
#include "d_veh_a_O_tanoa.sqf"
#endif
#ifdef __STRATIS__
#include "d_veh_a_O_default.sqf"
#endif
	];

	d_veh_a_W = [
		#include "d_veh_a_B_default.sqf"
	];

	d_veh_a_G = [
		#include "d_veh_a_G_default.sqf"
	];

#ifdef __ALTIS__
d_arti_observer_E = [["rhsgref_ins_squadleader"]];
#endif
#ifdef __CUP_CHERNARUS__
d_arti_observer_E = [["O_recon_JTAC_F"]];
#endif
#ifdef __CUP_TAKISTAN__
d_arti_observer_E = [["CUP_O_RUS_SpecOps_Scout_Autumn"]];
#endif
#ifdef __CUP_SARA__
d_arti_observer_E = [["CUP_O_sla_Officer"]];
#endif
#ifdef __TANOA__
d_arti_observer_E = [["O_T_Recon_JTAC_F"]];
#endif
#ifdef __STRATIS__
d_arti_observer_E = [["O_recon_JTAC_F"]];
#endif
	d_arti_observer_W = [["rhsusf_socom_marsoc_jtac"]];
	d_arti_observer_G = [["rhsgref_cdf_ngd_rifleman_m92"]];

	d_number_attack_planes = 1;
	d_number_attack_choppers = 1;

	// Type of aircraft, that will air drop stuff
	d_drop_aircraft =
#ifdef __OWN_SIDE_INDEPENDENT__
		"rhsgref_ins_g_Mi8amt";
#endif
#ifdef __OWN_SIDE_BLUFOR__
		"rhsusf_CH53E_USMC_D";
#endif
#ifdef __OWN_SIDE_OPFOR__
		"rhsgref_ins_Mi8amt";
#endif
#ifdef __TT__
		"rhsgref_ins_Mi8amt";
#endif

	if (isServer && {!d_no_ai}) then {
		d_taxi_aircraft =
#ifdef __OWN_SIDE_INDEPENDENT__
			"rhsgref_ins_g_Mi8amt";
#endif
#ifdef __OWN_SIDE_BLUFOR__
			"rhsusf_CH53E_USMC_D";
#endif
#ifdef __OWN_SIDE_OPFOR__
			"rhsgref_ins_Mi8amt";
#endif
#ifdef __TT__
			"rhsgref_ins_Mi8amt";
#endif
	};
d_cas_plane =
#ifdef __OWN_SIDE_INDEPENDENT__
			"I_Plane_Fighter_03_CAS_F";
#endif
#ifdef __OWN_SIDE_BLUFOR__
			"RHS_A10";
#endif
#ifdef __OWN_SIDE_OPFOR__
			"RHS_Su25SM_CAS_vvsc";
#endif
#ifdef __TT__
			["RHS_A10", "RHS_Su25SM_CAS_vvsc"];
#endif

	// max men for main target clear
	d_man_count_for_target_clear = 6;
	// max tanks for main target clear
	d_tank_count_for_target_clear = 1;
	// max cars for main target clear
	d_car_count_for_target_clear = 1;

	// time (in sec) between attack planes and choppers over main target will respawn once they were shot down (a random value between 0 and 240 will be added)
	d_airai_respawntime = 1200;

	d_side_missions_random = [];
	d_player_created = [];

	// don't remove d_recapture_indices even if you set d_WithRecapture to 1
	d_recapture_indices = [];

	// max number of cities that the enemy will recapture at once
	// if set to -1 no check is done
	d_max_recaptures = 2;

	d_time_until_next_sidemission = [
		[10,300], // if player number <= 10, it'll take 300 seconds until the next sidemission
		[20,400], // if player number <= 20, it'll take 400 seconds until the next sidemission
		[30,500], // if player number <= 30, it'll take 500 seconds until the next sidemission
		[40,600] // if player number <= 40, it'll take 600 seconds until the next sidemission
	];

	d_civilians_t = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan","C_Man_casual_6_F_tanoan","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F"];

	d_base_aa_vec =
#ifdef __OWN_SIDE_INDEPENDENT__
	"";
#endif
#ifdef __OWN_SIDE_BLUFOR__
	"RHS_Stinger_AA_pod_USMC_D";
#endif
#ifdef __OWN_SIDE_OPFOR__
	"rhsgref_ins_zsu234";
#endif
#ifdef __TT__
	"";
#endif

	d_wreck_cur_ar = [];

	d_sm_fortress = "Land_Cargo_House_V2_F";
	d_functionary = "C_Nikos_aged";
	d_fuel_station = "Land_FuelStation_Build_F";//Land_FuelStation_Shed_F
	d_sm_cargo = switch (d_enemy_side_short) do {
		case "E": {"rhsgref_ins_ural"};
		case "W": {"rhsusf_M977A4_BKIT_M2_usarmy_wd"};
		case "G": {"rhsgref_ins_g_ural"};
	};
	//d_sm_hangar = "Land_TentHangar_V1_F"; // Land_TentHangar_V1_F creates 3 objects and adding a killed eh makes it useless as the correct object might never get destroyed
	d_sm_hangar = "Land_Hangar_F";
	d_sm_tent = "Land_TentA_F";

	d_sm_land_tankbig = "Land_dp_bigTank_F";
	d_sm_land_transformer = "Land_dp_transformer_F";
	d_sm_barracks = "Land_i_Barracks_V2_F";
	d_sm_land_tanksmall = "Land_dp_smallTank_F";
	d_sm_land_factory = "Land_u_Barracks_V2_F";
	d_sm_small_radar = "Land_Radar_Small_F";

	d_soldier_officer = switch (d_enemy_side_short) do {
		case "E": {"rhsgref_ins_squadleader"};
		case "W": {"rhsusf_usmc_marpat_wd_officer"};
		case "G": {"rhsgref_cdf_ngd_officer"};
	};
	d_sniper = switch (d_enemy_side_short) do {
		case "E": {"rhsgref_ins_sniper"};
		case "W": {"rhsusf_usmc_marpat_wd_sniper"};
		case "G": {"rhsgref_ins_g_sniper"};
	};
	d_sm_arty = switch (d_enemy_side_short) do {
		case "E": {"rhsgref_ins_d30"};
		case "W": {"rhsusf_m109_usarmy"};
		case "G": {"rhsgref_ins_g_d30"}; // no independent arty in Alpha 3
	};
	d_sm_plane = switch (d_enemy_side_short) do {
		case "E": {"RHS_Su25SM_CAS_vvsc"};
		case "W": {"RHS_A10"};
		case "G": {"I_Plane_Fighter_03_CAS_F"};
	};
	d_sm_tank = switch (d_enemy_side_short) do {
		case "E": {"rhsgref_ins_t72ba"};
		case "W": {"rhsusf_m1a2sep1tuskiwd_usarmy"};
		case "G": {"rhsgref_ins_g_t72ba"};
	};
	d_sm_HunterGMG = switch (d_enemy_side_short) do {
		case "E": {"rhsgref_BRDM2_ins"};
		case "W": {"rhsusf_M1117_W"};
		case "G": {"rhsgref_BRDM2_ins_g"};
	};
	d_sm_SpeedBoat = switch (d_enemy_side_short) do {
		case "E": {"O_Boat_Armed_01_hmg_F"};
		case "W": {"rhsusf_mkvsoc"};
		case "G": {"I_Boat_Armed_01_hmg_F"};
	};
	d_sm_submarine = switch (d_enemy_side_short) do {
		case "E": {"O_SDV_01_F"};
		case "W": {"B_SDV_01_F"};
		case "G": {"I_SDV_01_F"};
	};
	d_sm_AssaultBoat = switch (d_enemy_side_short) do {
		case "E": {"O_Boat_Transport_01_F"};
		case "W": {"rhsusf_mkvsoc"};
		case "G": {"I_Boat_Transport_01_F"};
	};
	d_sm_chopper = switch (d_enemy_side_short) do {
		case "E": {"RHS_Ka52_vvs"};
		case "W": {"RHS_AH64D_wd"};
		case "G": {"rhsgref_ins_g_Mi8amt"};
	};
	d_sm_pilottype = switch (d_enemy_side_short) do {
		case "E": {"rhsusf_usmc_marpat_wd_helipilot"};
		case "W": {"rhsgref_ins_pilot"};
		case "G": {"rhsgref_ins_g_pilot"};
	};
	d_sm_wrecktype = switch (d_enemy_side_short) do {
		case "E": {"Land_Wreck_Heli_Attack_01_F"};
		case "W": {"BlackhawkWreck"};
		case "G": {"Land_Wreck_Heli_Attack_02_F"};
	};
	d_sm_ammotrucktype = switch (d_enemy_side_short) do {
		case "E": {"rhs_gaz66_ammo_vmf"};
		case "W": {"rhsusf_M977A4_AMMO_BKIT_usarmy_wd"};
		case "G": {"rhsgref_ins_g_gaz66_ammo"};
	};

	d_intel_unit = objNull;

	d_ArtyShellsBlufor = [
		"Sh_120mm_HE", // HE
		"Smoke_120mm_AMOS_White", // Smoke
		"G_40mm_HE" // dpicm
	];

	d_ArtyShellsOpfor = [
		"Sh_120mm_HE", // HE
		"Smoke_120mm_AMOS_White", // Smoke
		"G_40mm_HE" // dpicm
	];

	d_all_simulation_stoped = false;

	d_hd_sim_types = ["SHOTPIPEBOMB", "SHOTTIMEBOMB", "SHOTDIRECTIONALBOMB", "SHOTMINE"];
	d_hd_sim_types apply {toUpper _x};

	d_isle_defense_marker = "n_mech_inf";

	d_air_radar = switch (d_enemy_side_short) do {
		case "W": {"rhs_prv13"};
		case "E": {"rhs_prv13"};
		case "G": {"rhs_prv13"};
	};

	d_enemy_hq = switch (d_enemy_side_short) do {
		case "E": {"Land_Cargo_HQ_V1_F"};
		case "W": {"Land_Cargo_HQ_V1_F"};
		case "G": {"Land_Cargo_HQ_V1_F"};
	};

	// type of enemy plane that will fly over the main target
#ifndef __CUP__
	d_airai_attack_plane = switch (d_enemy_side_short) do {
		case "E": {["RHS_Su25SM_CAS_vvsc"]};
		case "W": {["RHS_A10"]};
		case "G": {["I_Plane_Fighter_03_CAS_F"]};
	};
#else
	d_airai_attack_plane = switch (d_enemy_side_short) do {
		case "E": {["RHS_Su25SM_CAS_vvsc","CUP_O_Su25_RU_3","CUP_O_Su25_RU_1","CUP_O_Su25_RU_2"]};
		case "W": {["RHS_A10"]};
		case "G": {["I_Plane_Fighter_03_CAS_F"]};
	};
#endif

#ifndef __CUP__
	// type of enemy chopper that will fly over the main target
	d_airai_attack_chopper = switch (d_enemy_side_short) do {
		case "E": {["RHS_Mi24V_vvs"]};
		case "W": {["RHS_AH64D_wd_GS"]};
		case "G": {["rhsgref_cdf_Mi35"]};
	};
#else
	// type of enemy chopper that will fly over the main target
	d_airai_attack_chopper = switch (d_enemy_side_short) do {
		case "E": {["RHS_Mi24V_vvs","CUP_O_Mi24_P_RU","CUP_O_Mi24_V_RU","CUP_O_Ka50_SLA"]};
		case "W": {["RHS_AH64D_wd_GS"]};
		case "G": {["rhsgref_cdf_Mi35"]};
	};
#endif

#ifdef __ALTIS__
	// enemy parachute troops transport chopper
	d_transport_chopper = switch (d_enemy_side_short) do {
		case "E": {["RHS_AN2"]};
		case "W": {["RHS_UH60M"]};
		case "G": {["rhsgref_ins_g_Mi8amt"]};
	};
#endif
#ifdef __TANOA__
	// enemy parachute troops transport chopper
	d_transport_chopper = switch (d_enemy_side_short) do {
		case "E": {["rhsgref_ins_Mi8amt"]};
		case "W": {["B_T_VTOL_01_infantry_blue_F"]};
		case "G": {["I_Heli_Transport_02_F"]};
	};
#endif
#ifdef __STRATIS__
	// enemy parachute troops transport chopper
	d_transport_chopper = switch (d_enemy_side_short) do {
		case "E": {["rhsgref_ins_Mi8amt"]};
		case "W": {["B_T_VTOL_01_infantry_blue_F"]};
		case "G": {["I_Heli_Transport_02_F"]};
	};
#endif
#ifdef __TT__
	// enemy parachute troops transport chopper
	d_transport_chopper = switch (d_enemy_side_short) do {
		case "E": {["rhsgref_ins_Mi8amt"]};
		case "W": {["B_T_VTOL_01_infantry_blue_F"]};
		case "G": {["I_Heli_Transport_02_F"]};
	};
#endif
#ifdef __CUP_CHERNARUS__
	d_transport_chopper = switch (d_enemy_side_short) do {
		case "E": {["CUP_O_MI6T_RU"]};
		case "W": {["B_Heli_Light_01_F"]};
		case "G": {["I_Heli_Transport_02_F"]};
	};
#endif
#ifdef __CUP_SARA__
	d_transport_chopper = switch (d_enemy_side_short) do {
		case "E": {["CUP_O_Mi8_SLA_1"]};
		case "W": {["B_Heli_Light_01_F"]};
		case "G": {["I_Heli_Transport_02_F"]};
	};
#endif
#ifdef __CUP_TAKISTAN__
	d_transport_chopper = switch (d_enemy_side_short) do {
		case "E": {["CUP_O_AN2_TK"]};
		case "W": {["B_Heli_Light_01_F"]};
		case "G": {["I_Heli_Transport_02_F"]};
	};
#endif

#ifndef __CUP__
	// light attack chopper (for example I_Heli_light_03_F with MG)
	d_light_attack_chopper = switch (d_enemy_side_short) do {
		case "E": {["rhsgref_cdf_reg_Mi17Sh"]};
		case "W": {["B_Heli_Light_01_armed_F"]};
		case "G": {["I_Heli_light_03_F"]};
	};
#else
	d_light_attack_chopper = switch (d_enemy_side_short) do {
		case "E": {["rhsgref_cdf_reg_Mi17Sh"]};
		case "W": {["B_Heli_Light_01_F"]};
		case "G": {["I_Heli_light_03_F"]};
	};
#endif
};

if (!isDedicated) then {
	__TRACE("preInit !isDedicated")
	// d_reserved_slot gives you the ability to add a reserved slot for admins
	// if you don't log in when you've chosen the slot, you'll get kicked after ~20 once the intro ended
	// default is no check, example: d_reserved_slot = "d_artop_1";
	d_reserved_slot = "";

	// d_uid_reserved_slots and d_uids_for_reserved_slots gives you the possibility to limit a slot
	// you have to add the var names of the units to d_uid_reserved_slots and in d_uids_for_reserved_slots the UIDs of valid players
	// d_uid_reserved_slots = ["d_alpha_1", "d_bravo_3"];
	// d_uids_for_reserved_slots = ["1234567", "7654321"];
	d_uid_reserved_slots = [];
	d_uids_for_reserved_slots = [];

	// this vehicle will be created if you use the "Create XXX" at a mobile respawn (old "Create Motorcycle") or at a jump flag
	// IMPORTANT !!!! for ranked version !!!!
	// if there is more than one vehicle defined in the array the vehicle will be selected by player rank
	// one vehicle only, vehicle is only available when the player is at least lieutenant
	d_create_bike =
#ifdef __OWN_SIDE_INDEPENDENT__
	["I_Quadbike_01_F"];
#endif
#ifdef __OWN_SIDE_BLUFOR__
	[["B_Quadbike_01_F", "B_LSV_01_unarmed_F"], ["B_Quadbike_01_F", "B_T_LSV_01_unarmed_F"]] select d_tanoa;
#endif
#ifdef __OWN_SIDE_OPFOR__
	[["O_Quadbike_01_F", "O_LSV_02_unarmed_F"], ["O_Quadbike_01_F", "O_T_LSV_02_unarmed_F"]] select d_tanoa;
#endif
#ifdef __TT__
	["O_Quadbike_01_F"];
#endif

	if (d_weather == 1) then {
		0 setOvercast 0;
	};

#ifdef __OWN_SIDE_BLUFOR__
	d_UAV_Small = "B_UAV_01_F";
	d_UAV_Terminal = "B_UavTerminal";
#endif
#ifdef __OWN_SIDE_OPFOR__
	d_UAV_Small = "O_UAV_01_F";
	d_UAV_Terminal = "O_UavTerminal";
#endif
#ifdef __OWN_SIDE_INDEPENDENT__
	d_UAV_Small = "I_UAV_01_F";
	d_UAV_Terminal = "I_UavTerminal";
#endif

	d_still_in_intro = true;

	d_cur_sm_txt = "";
	d_current_mission_resolved_text = "";

	// ammobox handling (default, loading and dropping boxes) it means the time diff in seconds before a box can be loaded or dropped again in a vehicle
	d_drop_ammobox_time = 10;
	d_current_truck_cargo_array = [];
	// d_check_ammo_load_vecs
	// the only vehicles that can load an ammo box are the transport choppers and MHQs__
	d_check_ammo_load_vecs =
#ifdef __OWN_SIDE_BLUFOR__
	[];
#endif
#ifdef __OWN_SIDE_OPFOR__
	["O_MRAP_02_F", "O_Heli_Light_02_unarmed_F"];
#endif
#ifdef __OWN_SIDE_INDEPENDENT__
	["I_MRAP_03_F", "I_Heli_light_03_unarmed_F"];
#endif
#ifdef __TT__
	["B_Heli_Light_01_F", "B_APC_Tracked_01_CRV_F", "O_Heli_Light_02_unarmed_F", "B_T_APC_Tracked_01_CRV_F"];
#endif

	d_check_ammo_load_vecs = d_check_ammo_load_vecs apply {toUpper _x};

	d_weapon_respawn = true;

	// points needed to get a specific rank
	// gets even used in the unranked versions, though it's just cosmetic there
#ifndef __TT__
	d_points_needed = [
		20, // Corporal
		50, // Sergeant
		90, // Lieutenant
		140, // Captain
		200, // Major
		270 // Colonel
	];
#else
	d_points_needed = [
		100, // Corporal
		400, // Sergeant
		1000, // Lieutenant
		3000, // Captain
		6000, // Major
		12000 // Colonel
	];
#endif

	d_marker_vecs = [];

	// is engineer
#ifndef __TT__
	d_is_engineer = [];
#else
	d_is_engineer = [];
#endif

	// can build mash
#ifndef __TT__
	d_is_medic = [];
#else
	d_is_medic = [];
#endif

	// can call in air drop
#ifndef __TT__
	d_can_call_drop_ar = [];
#else
	d_can_call_drop_ar = [];
#endif

	d_chophud_on = true;

	d_jump_helo =
#ifdef __OWN_SIDE_BLUFOR__
	"RHS_UH1Y_UNARMED";
#endif
#ifdef __OWN_SIDE_OPFOR__
	"O_Heli_Light_02_unarmed_F";
#endif
#ifdef __OWN_SIDE_INDEPENDENT__
	"I_Heli_light_03_unarmed_F";
#endif
#ifdef __TT__
	"I_Heli_light_03_unarmed_F";
#endif

	d_headbug_vehicle = "B_Quadbike_01_F";

	d_drop_max_dist = 500;

	// if the array is empty, anybody with a pilot uniform and headgear can fly (if the latter is enabled)
	// if you add the string name of playable units (var name in the editor) only those players get a pilot uniform and headgear
	// makes only sense when only pilots can fly is enabled
	// for example: ["pilot_1","pilot_2"];, case sensitiv
	// PLEASE DO NOT CHANGE THIS FOR THE TT VERSION, IT SHOULD BE AN EMPTY ARRAY!!!!
	d_only_pilots_can_fly = [];

	d_the_box = switch (d_own_side) do {
		case "GUER": {"Box_IND_Wps_F"};
		case "EAST": {"Box_East_Wps_F"};
		case "WEST": {"rhsusf_weapon_crate"};
	};
	d_the_base_box = switch (d_own_side) do {
		case "GUER": {"I_supplyCrate_F"};//Box_IND_WpsSpecial_F
		case "EAST": {"O_supplyCrate_F"};//Box_East_WpsSpecial_F
		case "WEST": {"rhsusf_weapon_crate"};//Box_NATO_WpsSpecial_F
	};

	d_rev_respawn_vec_types = [d_the_box, "rhsusf_M1117_W", "rhsusf_rg33_wd", "I_MRAP_03_F", "B_APC_Tracked_01_CRV_F"];

	// internal variables
	d_flag_vec = objNull;
	d_rscspect_on = false;
	d_player_can_call_drop = 0;
	d_player_can_call_arti = 0;
	d_player_can_call_cas = 0;
	d_eng_can_repfuel = false;
	d_there_are_enemies_atbase = false;
	d_enemies_near_base = false;
	d_player_is_medic = false;
	d_vec_end_time = -1;
	d_rscCrewTextShownTimeEnd = -1;
	d_commandingMenuIniting = false;
	d_DomCommandingMenuBlocked = false;
	d_playerInMHQ = false;
	d_player_in_vec = false;
	d_clientScriptsAr = [false, false];
	d_areArtyVecsAvailable = false;
	d_ao_arty_vecs = [];
	d_misc_store = d_HeliHEmpty createVehicleLocal [0,0,0];

	d_virtual_entities = ["d_virt_man_1", "d_virt_man_2", "d_virt_man_3", "d_virt_man_4", "d_virt_man_5"];

	// If you want to add additional non MHQ respawn points like additional bases for example
	// Usage: Each point array needs a unique name, position or marker name, description and a side (side is only valid for the TT version)
	// Example:
	//d_additional_respawn_points = [
	//	["D_UNIQUE_NAME_1", [1023, 5000, 4000], "My Cool Base", blufor],
	//	["D_UNIQUE_NAME_2", markerPos "myevencoolerbase", "My Even Cooler Base", blufor],
	//	["D_UNIQUE_NAME_3", markerPos "opforbase", "The Opfor Base", opfor],
	//	["D_UNIQUE_NAME_2", "myevencoolerbase", "My Even Cooler Base", blufor]
	//];
	d_additional_respawn_points = [];

	d_last_beam_target = "";

	d_add_resp_points_uni = [];
	{
		d_add_resp_points_uni pushBack (_x select 0);
		false
	} count d_additional_respawn_points;

	d_earplugs_fitted = false;

	d_phud_loc883 = localize "STR_DOM_MISSIONSTRING_883";
	d_phud_loc884 = localize "STR_DOM_MISSIONSTRING_884";
	d_phud_loc886 = localize "STR_DOM_MISSIONSTRING_906";
	d_phud_loc493 = localize "STR_DOM_MISSIONSTRING_493";

	if (isMultiplayer) then {
		// does work but not in EDEN preinit!!!
		// In 1.60 not working EachFrame in EDEN preinit is fixed.... PreloadFinished still doesn't work...
		d_prl_fin_id = addMissionEventHandler ["PreloadFinished", {
			d_preloaddone = true;
			diag_log [diag_frameno, diag_ticktime, time, "Preload finished"];
			removeMissionEventHandler ["PreloadFinished", d_prl_fin_id];
			d_prl_fin_id = nil;
		}];
	} else {
		d_prl_fin_id = ["DOM_PRL_ID", "onPreloadFinished", {
			d_preloaddone = true;
			diag_log [diag_frameno, diag_ticktime, time, "Preload finished"];
			[d_prl_fin_id, "onPreloadFinished"] call bis_fnc_removeStackedEventHandler;
			d_prl_fin_id = nil;
		}] call bis_fnc_addStackedEventHandler;
	};

	d_client_check_init = addMissionEventhandler ["EachFrame", {
		if (!isNull player) then {
			if (isMultiplayer && {isNil "xr_phd_invulnerable"}) then {
				xr_phd_invulnerable = true;
				player setVariable ["d_p_ev_hd_last", time];
			};
			if (!isNil "d_init_processed" && {time > 0 && {!isNil "d_preloaddone" && {!isNull (findDisplay 46)}}}) then {
				diag_log [diag_frameno, diag_tickTime, time, "Executing Dom local player pre start"];
				call compile preprocessFileLineNumbers "x_client\x_prestart.sqf";
				removeMissionEventHandler ["EachFrame", d_client_check_init];
				d_client_check_init = nil;
			};
		};
	}];
};

diag_log [diag_frameno, diag_ticktime, time, "Dom fn_preinit.sqf processed"];

// --- TICKET SYSTEM & LOGGING ----------------------------------------------------------------------------------------------------------------------
// Modify this value to change the initial ticket count.
#define ACE3	0
#define ACRE	0

TICKETS_WEST = 100;

// Max Tickets the Team may ever have - tickets gained beyond that point are lost
TICKETS_SOFTCAP = 100;
TICKETS_HARDCAP = 120;

// This is the Mission ID for the Database Log - set to 0 to disable DB Logging
// 0 ... disabled
// 1 ... Takistan Domination
// 2 ... Fallujah Insurgency
// 3 ... Reshmaan Patrol Ops
// 4 ... Takistan Domination Mod Version
// 5 ... Takistan Domination Gefechtsübungszentrum (GUeZ) Version
// 7 ... ISLA DI CAPRAIA PatrolOps Mod
// 99 ... Development Server
TF47_MISSIONID = 1;

// Mission Name/Version Info for Log
TF47_MISSIONINFO = "{MISSIONINFO}";

_pathtoscripts = "tf47CoreScripts\";

// _infantryStaminaClass = "US_Delta_Force_EP1";


//Whitelist ID: 0=None 1=Air 2=Armor 3=CCT 5=ZEUS

// --- DESPAWN PREVENTION MARKERS -------------------------------------------------------------------------------------------------------------------
_despawnPreventionMarkers = [
	["SafeZone",525]
];

// --- BASE CLEAN-UP MARKERS ------------------------------------------------------------------------------------------------------------------------
// see basecleanup.sqf for details
// Markers to Check for Base Clean-up Process
// [Marker Name, Clean-up Distance]
_baseCleanupMarkers = [];



// --- MAP CONTROL MARKERS --------------------------------------------------------------------------------------------------------------------------
// 		see mcmarker.sqf and mcmarkerchange.sqf for details
_statusMarkersInit = false;
_statusMarkerData = [
	["gbc1",			["gbc1_marker",				"b_hq",				"ColorGreen",	"CCT - Ground Battle Commander ""GODFATHER""",					true]],
	["gbc2",			["gbc2_marker",				"b_hq",				"ColorGreen",	"CCT - Asst. Ground Battle Commander ""BOWMAN""",	true]],
	["jtac1",			["jtac1_marker",				"b_hq",				"ColorGreen",	"JTAC #1 ""TOPMAN""",	true]],
	["jtac2",			["jtac2_marker",				"b_hq",				"ColorGreen",	"JTAC #2 ""REAPER""",	true]],
	["jfo",				["jfo_marker",				"b_hq",				"ColorGreen",	"JFO ""ROCKSTAR""",	true]],
	["tower",			["tower_marker",				"b_hq",				"ColorGreen",	"TOWER",	true]],
	//Air
	["uh601mev",	["callsign_uh60mev_m_1",		"b_air",			"ColorRed",	"DUSTOFF-01",													false]],
	["uh602mev",	["callsign_uh60mev_m_2",		"b_air",			"ColorRed",	"DUSTOFF-02",													false]],
	["ah1z1",			["callsign_ah1z1",			"b_air",			"ColorBrown",	"MANTICORE",													false]],
	["uh1y1",			["callsign_uh1y1",			"b_air",			"ColorBrown",	"GRIFFIN-01",													false]],
	["uh1y2",			["callsign_uh1y2",			"b_air",			"ColorBrown",	"GRIFFIN-02",													false]],
	["uh1y3",			["callsign_uh1y3",			"b_air",			"ColorBrown",	"GRIFFIN-03",												false]],
	["lb1",				["callsign_lb1",				"b_air",			"ColorBrown",	"BUTTERFLY-01",													false]],
	["lb2",				["callsign_lb2",				"b_air",			"ColorOrange",	"BUTTERFLY-02",													false]],
	["ch531",			["callsign_ch531",				"b_air",			"ColorOrange",	"SEAGULL",													false]],
	["a101",			["callsign_a101",				"b_plane",			"ColorOrange",	"THUNDERBIRD-01",												false]],
	["a102",			["callsign_a102",				"b_plane",			"ColorOrange",	"THUNDERBIRD-02",												false]],
	["f22a1",			["callsign_f22a1",				"b_plane",			"ColorOrange",	"RAPTOR-01",												false]],
	["f22a2",			["callsign_f22a2",				"b_plane",			"ColorOrange",	"RAPTOR-02",												false]],
	//Tanks
	["tank1",			["callsign_tank1",			"b_armor",			"ColorOrange",	"RHINO-01",														false]],
	["tank2",			["callsign_tank2",			"b_armor",			"ColorOrange",	"RHINO-02",														false]],
	["bradley1",	["callsign_bradley1",		"b_mech_inf",			"ColorOrange",	"LION-01",														false]],
	["bradley2",	["callsign_bradley2",		"b_mech_inf",		"ColorOrange",	"LION-01",														false]],
	//Boats
	["mark51",	["callsign_mark51",		"b_naval",		"ColorOrange",	"SHARK-01",														false]],
	["mark52",	["callsign_mark52",		"b_naval",		"ColorOrange",	"SHARK-02",														false]]
];
_statusMarkers = [_statusMarkerData, []] call CBA_fnc_hashCreate;



// --- LIFT RULES -----------------------------------------------------------------------------------------------------------------------------------
//		see vehicleOnSpawn.sqf
// _LiftHelicopters = ["seagull1","seagull2","pelican1"];
// _NoLiftHelicopters = ["crow1", "crow2", "dustoff1", "griffin1", "goose1", "manticore1"];


// --- No JUMP OUT VEH -----------------------------------------------------------------------------------------------------------------------------------
//		see vehicleOnEnter.sqf
_JumpOutHelicopters = ["uh601mev","uh602mev","uh1y1","uh1y2","uh1y3","ch531","lb1","lb2"];



// --- VEHICLE RESTRICTIONS -------------------------------------------------------------------------------------------------------------------------
// Vehicle Name, Driver Whitelist ID (0 for None), Crew Whitelist ID (0 for None), Driver Slots, Crew Slots
_vehicleRestrictionData = [
	//Aircraft
	["uh601mev", 			[1, 1,	["sar11","sar12","sar21","sar22"],									["sar13","sar14","sar15","sar16","sar23","sar24"]]],
	["uh602mev", 			[1, 1,	["sar11","sar12","sar21","sar22"],									["sar13","sar14","sar15","sar16","sar23","sar24"]]],
	["ah1z1", 				[1, 1,	["rwa11","rwa12"],																	["rwa11","rwa12"]]],
	["uh1y1", 				[1, 1,	["rwrt11","rwrt12","rwrt21","rwrt22"],							["rwrt13","rwrt14","rwrt23","rwrt24","rwrt11","rwrt12","rwrt21","rwrt22"]]],
	["uh1y2", 				[1, 1,	["rwrt11","rwrt12","rwrt21","rwrt22"],							["rwrt13","rwrt14","rwrt23","rwrt24","rwrt11","rwrt12","rwrt21","rwrt22"]]],
	["uh1y3", 				[1, 1,	["rwrt11","rwrt12","rwrt21","rwrt22"],							["rwrt13","rwrt14","rwrt23","rwrt24","rwrt11","rwrt12","rwrt21","rwrt22"]]],
	["lb1", 					[1, 1,	["rwrt11","rwrt12","rwrt21","rwrt22"],							["rwrt13","rwrt14","rwrt23","rwrt24","rwrt11","rwrt12","rwrt21","rwrt22"]]],
	["lb2", 					[1, 1,	["rwrt11","rwrt12","rwrt21","rwrt22"],							["rwrt13","rwrt14","rwrt23","rwrt24","rwrt11","rwrt12","rwrt21","rwrt22"]]],
	["ch531", 				[1, 1,	["rwrt11","rwrt12","rwrt21","rwrt22"],							["rwrt13","rwrt14","rwrt23","rwrt24","rwrt11","rwrt12","rwrt21","rwrt22"]]],
	["a101", 					[1, 1,	["fixwa11","fixwa12","fixwa13","fixwa14"], 													[]]],
	["a102", 					[1, 1,	["fixwa11","fixwa12","fixwa13","fixwa14"], 													[]]],
	["f22a1", 					[1, 1,	["fixwa11","fixwa12","fixwa13","fixwa14"], 													[]]],
	["f22a2", 					[1, 1,	["fixwa11","fixwa12","fixwa13","fixwa14"], 													[]]],
	//Tank
	["tank1",					[2, 2,	["armor13","armor23","mc5","armor11","armor12","armor21","armor22"], 													["armor13","armor23","mc5","armor11","armor12","armor21","armor22"]]],
	["tank2",					[2, 2,	["armor13","armor23","mc5","armor11","armor12","armor21","armor22"], 													["armor13","armor23","mc5","armor11","armor12","armor21","armor22"]]],
	["bradley1",			[2, 2,	["armor13","armor23","mc5","armor11","armor12","armor21","armor22"], 													["armor13","armor23","mc5","armor11","armor12","armor21","armor22"]]],
	["bradley2",			[2, 2,	["armor13","armor23","mc5","armor11","armor12","armor21","armor22"], 													["armor13","armor23","mc5","armor11","armor12","armor21","armor22"]]]
];
_vehicleRestrictions = [_vehicleRestrictionData, []] call CBA_fnc_hashCreate;



// --- SECURE SLOTS ---------------------------------------------------------------------------------------------------------------------------------
// Slot Name, Whitelist ID
_secureSlots = [
	["gbc1",	3],	// CCT Command and Control
	["gbc2",	3], // CCT Command and Control
	["jtac1",	3],  // JTAC
	["jtac2",	3],  // JTAC
	["jfo",	3],  // JFO
	["tower", 1]	//Tower
	//["Zeus2_u", 5]	//Zeus 2
];

// --- ALL SLOTS ------------------------------------------------------------------------------------------------------------------------------------
// used by Domination for Playermarkers, etc...
_allslots = [

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

// --- Infantry Ticket Costs ------------------------------------------------------------------------------------------------------------------------
// Infantry: 						2 Tickets
// Infantry Medics: 				3 Tickets
// Sniper/Spotter: 					2 Tickets
// Tank Crew: 						3 Tickets
// Rotary Transport Pilot/AC: 		5 Tickets
// Rotary Transport Crew: 			2 Tickets
// Rotary Transport Air Medic: 		3 Tickets
// Rotary Attack Pilot/AC/Gunner: 	5 Tickets
// Fixed Attack Pilot:				10 Tickets
// Mission Control Slots:			10 Tickets
// Admin Slot:						0 Tickets
_infantryTicketsDefault = 2;
_infantryTicketsData = [

	//medics
	["a4", 3], ["b4", 3], ["c4", 3], ["d4", 3],
	["e4", 3], ["f4", 3], ["g4", 3], ["h4", 3],
	["a4_1", 3], ["b4_1", 3], ["c4_1", 3], ["d4_1", 3],
	//Sniper&Spotter
	["snp1", 3], ["snp2", 3],
	//CCT
	["gbc1", 5], ["gbc2", 5], ["jtac1", 5], ["jtac2", 5],["tower", 5], ["jfo", 5],
	//Medevac
	["sar11", 5], ["sar12", 5], ["sar13", 3], ["sar14", 3],["sar15", 3], ["sar16", 3],
	["sar21", 5], ["sar22", 5], ["sar23", 3], ["sar24", 3],
	//RWRT
	["rwrt11", 5], ["rwrt12", 5], ["rwrt13", 3], ["rwrt14", 3],
	["rwrt21", 5], ["rwrt22", 5], ["rwrt23", 3], ["rwrt24", 3],
	//RWA
	["rwa11", 5], ["rwa12", 5],
	//FIXWA
	["fixwa11", 5], ["fixwa12", 5], ["fixwa13", 3], ["fixwa14", 3]

];
_infantryTickets = [_infantryTicketsData, _infantryTicketsDefault] call CBA_fnc_hashCreate;

// --- SatCon----------------------------------------------------------------------------------------------------------------------------------------
_satConSlotsData = [
	//["mc1",  true]
];
_satConSlots = [_satConSlotsData, false] call CBA_fnc_hashCreate;

// --- Active Mods ----------------------------------------------------------------------------------------------------------------------------------
_activeModsData = [
];
_activeMods = [_activeModsData, false] call CBA_fnc_hashCreate;

// --- Default Loadouts -----------------------------------------------------------------------------------------------------------------------------
_defaultLoadoutsData = [
/*
	["armor11", "crew"],			["armor12", "crew"],			["armor13", "crew"],
	["armor21", "crew"],			["armor22", "crew"],			["armor23", "crew"],
	["rotwt11", "crew"],			["rotwt12", "crew"],			["rotwt13", "crew"],			["rotwt14", "crew"],		["rotwt15", "crew"],
	["rotwt21", "crew"],			["rotwt22", "crew"],			["rotwt23", "crew"],			["rotwt24", "crew"],		["rotwt25", "crew"],
	["rotwa11", "crew"],			["rotwa12", "crew"],
	["fixwa11", "crew"],			["fixwa12", "crew"], 			["fixwa13", 10],
	["maceact", "squadleader"], 	["mace11", "squadleader"], 		["mace21", "squadleader"], 		["mace31", "squadleader"],
	["hammeract", "squadleader"], 	["hammer11", "squadleader"], 	["hammer21", "squadleader"], 	["hammer31", "squadleader"],
	["mace12", "medic"], 			["mace22", "medic"], 			["mace32", "medic"],
	["hammer12", "medic"], 			["hammer22", "medic"],			["hammer32", "medic"],
	["mc1", "cct"], 				["mc2", "cct"], 				["mc3", "cct"], 				["mc4", "cct"], 				["mc5", "cct"]
*/
];
_defaultLoadouts = [_defaultLoadoutsData, "basic"] call CBA_fnc_hashCreate;

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
TF47_MISSIONID = 99;

// Mission Name/Version Info for Log
TF47_MISSIONINFO = "CO@92 Domination 3 Lingor 1.0";

_pathtoscripts = "tf47CoreScripts\";

// _infantryStaminaClass = "US_Delta_Force_EP1";

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
	//["mc3",		["mc3marker",				"b_hq",				"ColorGreen",	"CCT - 2nd Joint Terminal Attack Controller ""REAPER-01""",	true]],
	//["mc3",			["mc4marker",				"b_hq",				"ColorGreen",	"Air Traffic Control ""TOWER""",							true]],
	//["mc5",		["mc5marker",				"b_hq",				"ColorGreen",	"TOC - Tactical Operations Center ""GODFATHER""",			true]],
	["uh601mev",		["callsign_uh60mev_m_1",		"b_air",			"ColorRed",	"DUSTOFF-01",													false]],
	["uh602mev",		["callsign_uh60mev_m_2",		"b_air",			"ColorRed",	"DUSTOFF-02",													false]],
	["mh6",			["callsign_mh6",			"b_air",			"ColorBrown",	"BUTTEFLY",													false]],
	["AH6J",		["callsign_ah6j",			"b_air",			"ColorBrown",	"FIREFLY",													false]],
	["ch47f",		["callsign_ch47f",			"b_air",			"ColorBrown",	"PELICAN",													false]],
	["mh47e",		["callsign_mh47e",			"b_air",			"ColorBrown",	"FALCON-01",												false]],
	["dustoff",		["callsign_dustoff",		"b_air",			"ColorBrown",	"DUSTOFF",													false]],
	["ah64d",		["callsign_ah64d",			"b_air",			"ColorOrange",	"DRAGON",													false]],
	["a10",			["callsign_a10",			"b_plane",			"ColorOrange",	"THUNDERBIRD",												false]],
	["fa18f",		["callsign_fa18f",			"b_plane",			"ColorOrange",	"FALCON-02",												false]],
	["m1a2_1",		["callsign_m1a2_1",			"b_armor",			"ColorOrange",	"M1A2",														false]],
	["m1a2_2",		["callsign_m1a2_2",			"b_armor",			"ColorOrange",	"M1A2",														false]],
	["m1a2_3",		["callsign_m1a2_3",			"b_armor",			"ColorOrange",	"M1A2",														false]],
	["m2a3_1",		["callsign_m2a3_1",			"b_mech_inf",		"ColorOrange",	"M2A3",														false]],
	["m2a3_2",		["callsign_m2a3_2",			"b_mech_inf",		"ColorOrange",	"M2A3",														false]],
	["m2a3_3",		["callsign_m2a3_3",			"b_mech_inf",		"ColorOrange",	"M2A3",														false]],
	["aav7",		["callsign_aav7",			"b_mech_inf",		"ColorOrange",	"AAV7",														false]]
];
_statusMarkers = [_statusMarkerData, []] call CBA_fnc_hashCreate;



// --- LIFT RULES -----------------------------------------------------------------------------------------------------------------------------------
//		see vehicleOnSpawn.sqf
// _LiftHelicopters = ["seagull1","seagull2","pelican1"];
// _NoLiftHelicopters = ["crow1", "crow2", "dustoff1", "griffin1", "goose1", "manticore1"];


// --- No JUMP OUT VEH -----------------------------------------------------------------------------------------------------------------------------------
//		see vehicleOnEnter.sqf
_JumpOutHelicopters = ["uh601","uh602","dustoff"];



// --- VEHICLE RESTRICTIONS -------------------------------------------------------------------------------------------------------------------------
// Vehicle Name, Driver Whitelist ID (0 for None), Crew Whitelist ID (0 for None), Driver Slots, Crew Slots
_vehicleRestrictionData = [
	["uh601mev", 			[1, 1,	["rotwt11","rotwt12","rotwt21","rotwt22","rotwt16","rotwt17","rotwt26","rotwt27","mc2","mc3"],							["rotwt16","rotwt17","rotwt26","rotwt27","rotwt11","rotwt12","rotwt21","rotwt22","mc2","mc3"]]],
	["uh602mev", 			[1, 1,	["rotwt11","rotwt12","rotwt21","rotwt22","rotwt16","rotwt17","rotwt26","rotwt27","mc2","mc3"],							["rotwt16","rotwt17","rotwt26","rotwt27","rotwt11","rotwt12","rotwt21","rotwt22","mc2","mc3"]]],
	["mh6", 			[1, 1,	["rotwt11","rotwt12","rotwt21","rotwt22","rotwt16","rotwt17","rotwt26","rotwt27","mc2","mc3"],							["rotwt16","rotwt17","rotwt26","rotwt27","rotwt11","rotwt12","rotwt21","rotwt22","mc2","mc3"]]],
	["ah6j", 			[1, 1,	["rotwt11","rotwt12","rotwt21","rotwt22","rotwt16","rotwt17","rotwt26","rotwt27","mc2","mc3"],							["rotwt16","rotwt17","rotwt26","rotwt27","rotwt11","rotwt12","rotwt21","rotwt22","mc2","mc3"]]],
	["ch47f", 			[1, 1,	["rotwt11","rotwt12","rotwt21","rotwt22","rotwt16","rotwt17","rotwt26","rotwt27","mc2","mc3"],							["rotwt16","rotwt17","rotwt26","rotwt27","rotwt11","rotwt12","rotwt21","rotwt22","mc2","mc3"]]],
	["mh47e", 			[1, 1,	["rotwt11","rotwt12","rotwt21","rotwt22","rotwt16","rotwt17","rotwt26","rotwt27","mc2","mc3"],							["rotwt16","rotwt17","rotwt26","rotwt27","rotwt11","rotwt12","rotwt21","rotwt22","mc2","mc3"]]],
	["dustoff", 			[1, 1,	["rotwt11","rotwt12","rotwt21","rotwt22","rotwt16","rotwt17","rotwt26","rotwt27","mc2","mc3"],							["rotwt16","rotwt17","rotwt26","rotwt27","rotwt11","rotwt12","rotwt21","rotwt22","mc2","mc3"]]],

	["ah64d", 			[1, 1,	["rotwa11","rotwa12","mc2","mc3"], 														["rotwa11","rotwa12"]]],
	//["dragon2", 		[1, 1,	["rotwa21","rotwa11","mc2","mc3"], 														["rotwa22","rotwa12"]]],


	["a10", 			[1, 1,	["fixwa21","mc2","mc3"], 													[]]],
	["fa18f", 			[1, 1,	["fixwa11","fixwa12","mc2","mc3"], 													["fixwa11","fixwa12"]]],
	//["strike1", 		[1, 1,	["fixwa21","mc2","mc3"], 											[]]],
	//["strike2", 		[1, 1,	["fixwa21","mc2","mc3"],			 								[]]],
	//["albatros1", 		[1, 1,	["fixwa11","fixwa12","fixwa21","fixwa31","mc2","mc3"],			[]]],
	//["albatros2", 		[1, 1,	["fixwa11","fixwa12","fixwa21","fixwa31","mc2","mc3"],			[]]],

	//["towtrac1",	[1, 0,	["rotwt11","rotwt12","rotwt21","rotwt22","fixwa11","fixwa12","fixwa13","mc4","mc5"], 		[]]],
	//["towtrac2",	[1, 0,	["rotwt11","rotwt12","rotwt21","rotwt22","fixwa11","fixwa12","fixwa13","mc4","mc5"], 		[]]],

	//["tiger1",			[2, 2,	["armor11","armor21","mc5"], 													["armor11","armor12","armor13","armor21","armor22","armor23"]]],
	//["tiger2",			[2, 2,	["armor11","armor21","mc5"], 													["armor11","armor12","armor13","armor21","armor22","armor23"]]],
	["m1a2_1",			[2, 2,	["armor13","armor23","mc5","armor11","armor12","armor21","armor22"], 													["armor13","armor23","mc5","armor11","armor12","armor21","armor22"]]],
	["m1a2_2",			[2, 2,	["armor13","armor23","mc5","armor11","armor12","armor21","armor22"], 													["armor13","armor23","mc5","armor11","armor12","armor21","armor22"]]],
	["m1a2_3",			[2, 2,	["armor13","armor23","mc5","armor11","armor12","armor21","armor22"], 													["armor13","armor23","mc5","armor11","armor12","armor21","armor22"]]],
	["m2a3_1",			[2, 2,	["armor13","armor23","mc5","armor11","armor12","armor21","armor22"], 													["armor13","armor23","mc5","armor11","armor12","armor21","armor22"]]],
	["m2a3_2",			[2, 2,	["armor13","armor23","mc5","armor11","armor12","armor21","armor22"], 													["armor13","armor23","mc5","armor11","armor12","armor21","armor22"]]],
	["m2a3_3",			[2, 2,	["armor13","armor23","mc5","armor11","armor12","armor21","armor22"], 													["armor13","armor23","mc5","armor11","armor12","armor21","armor22"]]],
	["aav7",			[2, 2,	["armor13","armor23","mc5","armor11","armor12","armor21","armor22"], 													["armor13","armor23","mc5","armor11","armor12","armor21","armor22"]]]

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

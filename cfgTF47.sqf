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
TF47_MISSIONINFO = "CO@64 Invade&Annex Takistan 0.6";

_pathtoscripts = "tf47CoreScripts\";

// _infantryStaminaClass = "US_Delta_Force_EP1";

// --- DESPAWN PREVENTION MARKERS -------------------------------------------------------------------------------------------------------------------
_despawnPreventionMarkers = [
	["SafeZone",300],
	["fob_chapman",120]
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
	["mc1",			["mc1marker",				"b_hq",				"ColorGreen",	"CCT - Command and Control ""SPECTRE""",					true]],
	["mc2",			["mc2marker",				"b_hq",				"ColorGreen",	"CCT - 1st Joint Terminal Attack Controller ""TOPMAN""",	true]],
	//["mc3",		["mc3marker",				"b_hq",				"ColorGreen",	"CCT - 2nd Joint Terminal Attack Controller ""REAPER-01""",	true]],
	["mc3",			["mc4marker",				"b_hq",				"ColorGreen",	"Air Traffic Control ""TOWER""",							true]],
	//["mc5",		["mc5marker",				"b_hq",				"ColorGreen",	"TOC - Tactical Operations Center ""GODFATHER""",			true]],
	["uh601",		["callsign_uh60m_1",		"b_air",			"ColorBrown",	"RAVEN-01",													false]],
	["uh602",		["callsign_uh60m_2",		"b_air",			"ColorBrown",	"RAVEN-02",													false]],
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
	["uh601", 			[1, 1,	["rotwt11","rotwt12","rotwt21","rotwt22","rotwt16","rotwt17","rotwt26","rotwt27","mc2","mc3"],							["rotwt16","rotwt17","rotwt26","rotwt27","rotwt11","rotwt12","rotwt21","rotwt22","mc2","mc3"]]],
	["uh602", 			[1, 1,	["rotwt11","rotwt12","rotwt21","rotwt22","rotwt16","rotwt17","rotwt26","rotwt27","mc2","mc3"],							["rotwt16","rotwt17","rotwt26","rotwt27","rotwt11","rotwt12","rotwt21","rotwt22","mc2","mc3"]]],
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
	["mc1",	3],	// CCT Command and Control
	["mc2",	3], // CCT 1st JTAC
	["mc3",	1],  // TOWER
	["Zeus3_u", 5],	//Zeus 1
	["Zeus2_u", 5]	//Zeus 2
];

// --- ALL SLOTS ------------------------------------------------------------------------------------------------------------------------------------
// used by Domination for Playermarkers, etc...
_allslots = [
	"alphaact","alpha21","alpha22","alpha23","alpha24","alpha31","alpha32","alpha33","alpha34","alpha41","alpha42","alpha43","alpha44",
	"bravoact","bravo21","bravo22","bravo23","bravo24","bravo31","bravo32","bravo33","bravo34","bravo41","bravo42","bravo43","bravo44",
	"charlieact","charlie21","charlie22","charlie23","charlie24","charlie31","charlie32","charlie33","charlie34",
	"armor11","armor12","armor13",
	"armor21","armor22","armor23",
	"rotwt11","rotwt12","rotwt16","rotwt17","airmedic11","airmedic12",
	"rotwa21","rotwa22","rotwt22","rotwt21","rotwt26","rotwt27",
	"fixwa11","fixwa12","fixwa31",
	"mc1","mc2","mc3",
	"ghost1","ghost2",
	"Zeus2_u",
	"Zeus3_u"
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
_infantryTicketsDefault = 1;
_infantryTicketsData = [
	["charlie22", 3],	["charlie32", 3],		
	["alpha22", 3],		["alpha32", 3],		["alpha42", 3],
	["bravo22", 3],		["bravo32", 3],		["bravo42", 3],
	["armor11", 3],		["armor12", 3], 	["armor13", 3],
	["armor21", 3], 	["armor22", 3], 	["armor23", 3],	
	["rotwt11", 5],		["rotwt12", 5],		["rotwt16", 5],		["rotwt17", 5],
	["airmedic11", 3],	["airmedic12", 3],
	["rotwt21", 5],		["rotwt22", 5], 	["rotwt26", 5],		["rotwt27", 5],
	["rotwa11", 5],		["rotwa12", 5],
	//["rotwa21", 5],	["rotwa22", 5],
	["fixwa11", 5],		["fixwa12", 3],		["fixwa21", 5],
	["mc1", 10],			["mc2", 10],			["mc3", 10]
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
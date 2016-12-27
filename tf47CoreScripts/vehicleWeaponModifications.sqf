/*
* This script modifies certain vehicle loadouts to better fit our balancing needs
* 
* Tested with :
* Arma 3 1.36
* 
* @category   Clienside Serverside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @author     [TF47] Copusirum
* @author     [TF47] Chris
* @based on   Simple Vehicle Respawn Script v1.7 (arlechin@hotmail.com) 
* @website	  http://taskforce47.de/
* @version    1.0
*/
 
 if (!isServer) exitWith {};

_unit = _this select 0;
_unitName = format["%1", _unit];

// a10 weapon balancing
if (_unitName == "a10") then {
	_unit removeWeapon "rhs_weap_agm65"; 
	_unit removeMagazine "rhs_mag_agm65";
};

// harrier weapon balancing
if (_unitName == "wasp1") then {
	/*
	_unit removeMagazine "6Rnd_Mk82";
	_unit removeWeapon "Mk82BombLauncher_6";	
	_unit removeMagazine "2Rnd_Sidewinder_AH1Z";
	_unit removeWeapon "SidewinderLaucher_AH1Z";	
	_unit removeMagazine "14Rnd_FFAR";
	_unit removeWeapon "FFARLauncher_14";
	
	_unit addWeapon "ACE_Mk82BombLauncher2";
	_unit addMagazineTurret ["ACE_2Rnd_Mk82",[-1]];
	_unit addWeapon "ACE_SidewinderLaucher";
	_unit addMagazineTurret ["4Rnd_Sidewinder_AV8B",[-1]];
*/
};


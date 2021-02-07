/**
* A3-RP
* Client-side
* file: spawn_menu_spawn
* desc: Executed when spawn button is pressed
*/

private _display 		= findDisplay 1100;
private _spawn_type		= _display getVariable "spawn_type";
private _spawn_position = [];

if (_spawn_type == "spawn") then {
	/**
	* If basic spawn
	*/
	private _spawns_list 	= _display displayCtrl 1102;
	private _spawn_data 	= parseNumber(_spawns_list lbData (lbCurSel _spawns_list));
	private _spawns 		= call client_fnc_get_spawns;
	private _spawn 			= _spawns select _spawn_data;
	_spawn_position 		= [_spawn] call client_fnc_get_spawn_position;
	[format["[fn_spawn_menu_spawn]: Selected spawn : %1", _spawn select 0]] call client_fnc_log_me;
} else {
	/**
	* If spawn in building
	*/
	private _spawns_list 	= _display displayCtrl 1105;
	private _spawn_data 	= parseNumber(_spawns_list lbData (lbCurSel _spawns_list));
	private _spawns			= _display getVariable ["building_list", []];
	private _spawn 			= _spawns select _spawn_data;
	/** Spawn format is 
	* [id, "classname", x, y, z, "custom name"]
	* [25, "Land_i_Shop_02_V3_F", 3914.37, 13864.8, 0.468246, "Mon habitation"]
	*/
	
	private _building		= nearestObject [[_spawn select 2, _spawn select 3, _spawn select 4], _spawn select 1];
	_spawn_position 		= _building buildingPos 0;
};

/**
* Ask the server to teleport the player
*/
[player, _spawn_position] remoteExec ["SRV_fnc_teleport_me", 2];

closeDialog 0;

player setVariable ["client_cam_intro_running", false];

/**
* This variable is used by the server to not save the player when he hasn't spawn yet
*/
player setvariable ["client_spawned", true, true];
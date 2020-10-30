/**
* A3-RP
* Server-side
* file: init.sqf
*/

SRV_is_ready = false;
publicVariable "SRV_is_ready";

SRV_log_me_id = 0;
["A3RP Server starting"] call SRV_fnc_log_me;

/**
* Get the database name from description.ext
*/
private _database_name 	= getText(missionConfigFile >> "CfgServer" >> "database_name");

/**
* Initiate the connection to the SQL server
*/
private _conn = [_database_name] call DB_fnc_init_extdb3;

if (!_conn) exitWith {
	/**
	* If connection failure
	*/
	[format ["[extDB3]: Can't connect to database [%1]", _database_name]] call SRV_fnc_log_me;
	["A3RP Server couldn't start because of extDB3/SQL failure"] call SRV_fnc_log_me;
};

/**
* Connection successfull
*/
[format ["[extDB3]: Connected to database [%1]", _database_name]] call SRV_fnc_log_me;

/**
* Set Event Handlers/addMissionEventHandler
*/
["Setting up Event Handlers"] call SRV_fnc_log_me;
call SRV_fnc_init_eventhandler;
["Loading vehicles"] call SRV_fnc_log_me;
call SRV_fnc_load_vehicles;

SRV_is_ready = true;
publicVariable "SRV_is_ready";
["A3RP Server started"] call SRV_fnc_log_me;

/**
* Spawn save thread
*/
[] spawn SRV_fnc_save_world;
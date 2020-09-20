/**
* A3-RP
* Server-side
* file: init.sqf
*/

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

if (_conn) then {
	/**
	* If connection successfull
	*/
	[format ["[extDB3]: Connected to database [%1]", _database_name]] call SRV_fnc_log_me;
} else {
	/**
	* If connection failure
	*/
	[format ["[extDB3]: Can't connect to database [%1]", _database_name]] call SRV_fnc_log_me;
};

["A3RP Server started"] call SRV_fnc_log_me;
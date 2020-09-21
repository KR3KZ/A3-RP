/**
* A3-RP
* Server-side
* file: init_extdb3.sqf
*/

/**
* If extdb3 is already initialized, exit
*/
if (!isNil "SRV_extdb3_protocol_name") exitWith {
	[format["[extDB3]: SRV_extdb3_protocol_name already initialized [%1]", SRV_extdb3_protocol_name]] call SRV_fnc_log_me;
};

/**
* Get the database name param from init.sqf
*/
private _database_name 	= param [0, "", [""]];
private _return = false;
private _db_added = false;
private _conn_count = 1;

/**
* 9 represent the system mode
* ADD_DATABASE is a command telling extDB3 to connect to a new database
* _database_name relates to the section in the extdb3-conf.ini
* Return [1] if successfull
* Return [0,""Database Connection Error""] if failure
*/
private _add_database = "extDB3" callExtension format ["9:ADD_DATABASE:%1", _database_name];
_add_database = call compile(_add_database);

/**
* If connection failure then try to reconnect
*/
if (_add_database select 0 == 0) then {
	while {!_db_added && _conn_count <= 10} do {
		/**
		* Try to reconnect every 10s until _db_added is true or _conn_count <= 10
		*/
		sleep 10;
		[format["[extDB3]: Database connection error, reconnecting to [%1]", _database_name]] call SRV_fnc_log_me;
		_add_database = "extDB3" callExtension format ["9:ADD_DATABASE:%1", _database_name];
		_add_database = call compile(_add_database);
		_conn_count = _conn_count + 1;
		if (_add_database select 0 == 1) then {
			[format["[extDB3]: Successfully reconnected to [%1] after [%2] tries", _database_name, _conn_count]] call SRV_fnc_log_me;
			_db_added = true;
		};
	};

	if (_conn_count > 10) then {
		"extdb3_failed" call BIS_fnc_endMissionServer;
	};
};

if (_add_database select 0 == 1) then {
	/**
	* If connection successfull
	* Generate the protocol name, will be used to send requests to the database
	*/
	private _protocol_name = str(round(random(1000)));

	/**
	* ADD_DATABASE_PROTOCOL is a command telling extDB3 to add to a new protocol
	* _database_name specifies the database you want to use the protocol for
	* _protocol_name can be chosen freely
	* TEXT2 wraps all text datatypes in single quotes '
	*/
	_add_database_protocol = "extDB3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%1:SQL:%2:TEXT2", _database_name, _protocol_name];

	if (_add_database_protocol isEqualTo "[1]") then {
		/**
		* If protocol is added
		* Make the _protocol_name definitive with compileFinal
		*/
		SRV_extdb3_protocol_name = compileFinal(_protocol_name);

		/**
		* Lock the database for safety
		*/
		"extDB3" callExtension "9:LOCK";

		_return = true;
	};
};

/**
* Return extDB3 connection state
*/
_return
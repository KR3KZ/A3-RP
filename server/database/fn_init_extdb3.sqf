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
private _database_name 	= param [0, ""];
private _return = false;

/**
* 9 represent the system mode
* ADD_DATABASE is a command telling extDB3 to connect to a new database
* _database_name relates to the section in the extdb3-conf.ini
*/
private _add_database = "extDB3" callExtension format ["9:ADD_DATABASE:%1", _database_name];

if (_add_database isEqualTo "[1]") then {
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
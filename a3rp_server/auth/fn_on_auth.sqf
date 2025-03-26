/**
* A3-RP
* Server-side
* file: on_auth.sqf
* desc: Handle player authentification
*/

private _player	= param [0, objNull, [objNull]];

if (isNull _player) exitWith {};

// -------------- Account --------------

private _player_uid 	= getPlayerUID _player;
private _player_account = [_player_uid] call SRV_fnc_select_account;
private _client_acc_id  = 0;

if !("id" in _player_account && "steam_id" in _player_account) exitWith {
	/**
	* If MariaDBQueryException Exception
	*/
	[format["[fn_on_auth] something went wrong: [%1]", _player_account]] call SRV_fnc_log_me;
};

/*
* If the player is not in the database, insert it
*/
if (_player_account get "id" isEqualTo []) then {
	[format["[fn_on_auth]: [%1] is not in database, let's insert it", _player_uid]] call SRV_fnc_log_me;

	/**
	* Insert steam_id in database
	*/
	private _insert = [_player_uid] call SRV_fnc_insert_account;
	_insert = call compile(_insert);

	if (_insert select 0 == 1) then {
		private _player_account = [_player_uid] call SRV_fnc_select_account;
		_client_acc_id = _player_account get "id" select 0;
	} else {
		remoteExec ["client_fnc_something_went_wrong", _player];
	};
} else {
	_client_acc_id = _player_account get "id" select 0;
};

if (_client_acc_id == 0) exitWith {
	/**
	* If MariaDBQueryException Exception
	*/
	[format["[fn_on_auth] something went wrong, _client_acc_id is 0"]] call SRV_fnc_log_me;
};

[_client_acc_id] remoteExec ["auth_fnc_on_client_account_id", _player];

/**
* Setting the client_account_id var, no one but server can access it
*/
_player setVariable ["client_account_id", _client_acc_id, 2];

// -------------- Players --------------

private _player_name 	= name _player;
private _player_side 	= format["%1", side _player];

/**
* If the player name is only one word, kick him
*/
private _player_name_split = _player_name splitString " ";
if (count(_player_name_split) <= 1) exitWith {
	remoteExec ["client_fnc_bad_name", _player];
};

private _players_list = [_player_uid, _player_side] call SRV_fnc_select_players;

if !("player.id" in _players_list) exitWith {
	/**
	* If MariaDBQueryException Exception
	*/
	[format["[fn_on_ask_players]: [%1]", _players_list]] call SRV_fnc_log_me;
};

if (_players_list get "player.id" isEqualTo []) then {
	/**
	* The player is not in the database
	*/
	[format["[fn_on_ask_players]: [%1] [%2] is not in database", _player_uid, _player_side]] call SRV_fnc_log_me;

	/**
	* Insert player in database
	*/
	private _defaultHashMap = createHashMap;
	_defaultHashMap set ["client_uid", _player_uid];
	_defaultHashMap set ["client_side", _player_side];
	_defaultHashMap set ["client_name", _player_name];

	private _insert = [_defaultHashMap] call SRV_fnc_insert_player;
	_insert = call compile(_insert);

	if (_insert select 0 == 1) then {
		private _players_list = [_player_uid, _player_side] call SRV_fnc_select_players;
		[_players_list] remoteExec ["auth_fnc_on_players_list", _player];
	} else {
		remoteExec ["client_fnc_something_went_wrong", _player];
	};
} else {
	/**
	* The player exist in the database
	*/
	[format["[fn_on_ask_players]: [%1] [%2] exist in database, player info: [%3], send it to the client", _player_side, _player_uid, _players_list]] call SRV_fnc_log_me;

	/**
	* Send player info's to the client
	*/
	[_players_list] remoteExec ["auth_fnc_on_players_list", _player];
};
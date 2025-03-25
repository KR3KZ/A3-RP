/*
* A3-RP
* Server-side
* file: on_ask_players.sqf
* desc: The client asks if he has players in the database, answer needed
*/

private _player 		= param [0, objNull, [objNull]];

if (isNull _player) exitWith {};

private _player_uid 	= getPlayerUID _player; // Steam ID "76561198108858505"
private _player_side 	= format["%1", side _player]; // Side "CIV"
private _player_name 	= name _player; // Name 'Joe Clarks'
private _player_gear 	= format ["%1", getUnitLoadout _player]; // Gear '[[],[],[],[],[],[],"","",[],["","","","","",""]]'

[format["[fn_on_ask_players]: Request from [%1] [%2] [%3] received", _player_uid, _player_side, _player_name]] call SRV_fnc_log_me;

/**
* If the player name is only one word, kick him
*/
private _player_name_split = _player_name splitString " ";
if (count(_player_name_split) <= 1) exitWith {
	remoteExec ["client_fnc_bad_name", _player];
};

_player_name = _player_name_split joinString " ";

private _res = [_player_uid, _player_side] call SRV_fnc_select_players;

if !("player.id" in _res) exitWith {
	/**
	* If MariaDBQueryException Exception
	*/
	[format["[fn_on_ask_players]: [%1]", _res]] call SRV_fnc_log_me;
};

if (_res get "player.id" isEqualTo []) then {
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
	_defaultHashMap set ["client_gear", _player_gear];

	private _insert_done = [_defaultHashMap] call SRV_fnc_insert_player;

	/**
	* Make sure insert was successfull
	*/
	[_player] call SRV_fnc_on_ask_players;
} else {
	/**
	* The player exist in the database
	*/
	[format["[fn_on_ask_players]: [%1] [%2] exist in database, player info: [%3], send it to the client", _player_side, _player_uid, _res]] call SRV_fnc_log_me;

	/**
	* Send player info's to the client
	*/
	[_res] remoteExec ["auth_fnc_on_players_list", _player];
};
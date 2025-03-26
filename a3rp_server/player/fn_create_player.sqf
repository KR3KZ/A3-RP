/*
* A3-RP
* Server-side
* file: create_player.sqf
* desc: Create a new character in database
*/

private _player 		= param [0, objNull, [objNull]];

if (isNull _player) exitWith {};

private _player_uid 	= getPlayerUID _player;
private _player_side 	= format["%1", side _player];
private _player_name 	= name _player;

private _res = [_player_uid, _player_side, _player_name] call SRV_fnc_select_player_by_name;

if !("player.id" in _res) exitWith {
	/**
	* If MariaDBQueryException Exception
	*/
	[format["[fn_on_create_player]: [%1]", _res]] call SRV_fnc_log_me;
};

if (_res get "player.id" isEqualTo []) then {
	/**
	* The player is not in the database
	*/
	[format["[fn_create_player]: [%1] [%2] [%3] is not in database", _player_uid, _player_side, _player_name]] call SRV_fnc_log_me;

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
		[_players_list] remoteExec ["auth_fnc_on_player_created", _player];
	} else {
		remoteExec ["client_fnc_something_went_wrong", _player];
	};

};
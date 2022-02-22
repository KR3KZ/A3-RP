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
private _player_gear 	= format ["%1", getUnitLoadout _player];

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
	private _insert_done = [_player_uid, _player_side, _player_name, _player_gear] call SRV_fnc_insert_player;

	/**
	* Make sure insert was successfull
	*/
	[_player] call SRV_fnc_create_player;
} else {
	/**
	* The player exist in the database
	*/
	[format["[fn_on_create_player]: [%1] [%2] exist in database, player info: [%3], send it to the client", _player_side, _player_uid, _res]] call SRV_fnc_log_me;

	/**
	* Send player info's to the client
	*/
	[_res] remoteExec ["auth_fnc_on_player_created", _player];
};
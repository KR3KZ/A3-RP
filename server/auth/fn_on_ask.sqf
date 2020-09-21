/*
* A3-RP
* Server-side
* file: on_ask.sqf
* desc: The client asks if he is already in the database, answer needed
*/

private _player = param [0, objNull, [objNull]];
private _player_uid = getPlayerUID _player;

[format["[fn_on_ask]: Request from [%1] received", _player_uid]] call SRV_fnc_log_me;

private _res = [_player_uid] call SRV_fnc_select_steam_profile;

if (_res select 0 == 0) exitWith {
	/**
	* If MariaDBQueryException Exception
	*/
	[format["[fn_on_ask]: [%1]", _res]] call SRV_fnc_log_me;
};

if (_res isEqualTo []) then {
	/**
	* The steam_id is not in the database
	*/
	[format["[fn_on_ask]: [%1] is not in database", _player_uid]] call SRV_fnc_log_me;

	/**
	* Insert steam_id in database
	*/
	[_player_uid] call SRV_fnc_insert_steam_profile;

	/**
	* Make sure insert was successfull
	*/
	[_player] call SRV_fnc_on_ask;

} else {
	/**
	* The steam_id exist in the database
	*/
	[format["[fn_on_ask]: [%1] exist in database, id: [%2], send it to the client", _player_uid, _res select 0]] call SRV_fnc_log_me;

	[_res select 0] remoteExec ["auth_fnc_on_client_id", _player];
};
/*
* A3-RP
* Server-side
* file: select_account.sqf
* desc: Select account in database and return result
*/

/**
* Getting player UID from on_ask_account
*/
private _player_uid = param [0, "", [""]];

private _query = format ["
	SELECT id, steam_id
	FROM account
	WHERE steam_id = '%1'
", _player_uid];

private _res = [_query] call DB_fnc_select;

_res
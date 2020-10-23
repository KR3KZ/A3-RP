/**
* A3-RP
* Server-side
* file: insert_account.sqf
* desc: Insert account in database
*/

private _player_uid = param [0, "", [""]];

private _query = format ["
	INSERT INTO account
	(steam_id)
	VALUES
	('%1')
", _player_uid];

private _res = [_query] call DB_fnc_execute;

_res
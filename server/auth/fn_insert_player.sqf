/**
* A3-RP
* Server-side
* file: insert_player.sqf
* desc: Insert player in database
*/

params [
	["_player_uid", "", [""]],
	["_player_side", "", [""]],
	["_player_name", "", [""]]
];

private _query = format ["
	INSERT INTO player
	(account_id, side_id, name, cash)
	VALUES
	((SELECT id FROM ACCOUNT WHERE steam_id = '%1'), (SELECT id FROM side WHERE type = '%2'), '%3', 0)
", _player_uid, _player_side, _player_name];

private _res = [_query] call DB_fnc_execute;

_res
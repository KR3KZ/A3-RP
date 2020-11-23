/**
* A3-RP
* Server-side
* file: insert_player.sqf
* desc: Insert player in database
*/

params [
	["_player_uid", "", [""]],
	["_player_side", "", [""]],
	["_player_name", "", [""]],
	["_player_gear", "", [""]]
];

if (_player_uid == "" || _player_side == "" || _player_name == "" || _player_gear == "") exitWith {};

private _query = format ["
	INSERT INTO player
	(account_id, side_id, name, cash, gear)
	VALUES
	((SELECT id FROM ACCOUNT WHERE steam_id = '%1'), (SELECT id FROM side WHERE type = '%2'), '%3', 0, '%4')
", _player_uid, _player_side, _player_name, _player_gear];

private _res = [_query] call DB_fnc_execute;

_res
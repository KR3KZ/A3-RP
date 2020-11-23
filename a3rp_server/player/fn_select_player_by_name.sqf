/*
* A3-RP
* Server-side
* file: select_player_by_name.sqf
* desc: Select player by name in database and return result
*/

params [
	["_player_uid", "", [""]],
	["_player_side", "", [""]],
	["_player_name", "", [""]]
];

if (_player_uid == "" || _player_side == "" || _player_name == "") exitWith {};

private _query = format["
	SELECT player.id,
	player.name,
	player.cash,
	player.gear,
	player.pos_atl_x,
	player.pos_atl_y,
	player.pos_atl_z,
	player.dir
	FROM account, player, side
	WHERE player.account_id = account.id
	AND player.side_id = side.id
	AND steam_id = '%1'
	AND side.type = '%2'
	AND player.name = '%3'
", _player_uid, _player_side, _player_name];

private _res = [_query, true] call DB_fnc_select;

_res
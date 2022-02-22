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

private _res = [
	["account", "player", "side"],
	["player.id", "player.name", "player.cash", "player.gear", "player.pos_atl_x", "player.pos_atl_y", "player.pos_atl_z", "player.dir"],
	["player.account_id = account.id", "player.side_id = side.id", format["steam_id = '%1'", _player_uid], format["side.type = '%1'", _player_side], format["player.name = '%1'", _player_name]]
] call DB_fnc_select;

_res
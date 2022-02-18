/*
* A3-RP
* Server-side
* file: select_players.sqf
* desc: Select players in database and return result
*/

/**
* Getting player UID and side from on_ask_players
*/

params [
	["_player_uid", "", [""]],
	["_player_side", "", [""]]
];

if (_player_uid == "" || _player_side == "") exitWith {};

private _res = [
	["account", "player", "side"],
	["player.id", "player.name", "player.cash", "player.gear", "player.pos_atl_x", "player.pos_atl_y", "player.pos_atl_z", "player.dir"],
	["player.account_id = account.id", "player.side_id = side.id", format["steam_id = '%1'", _player_uid], format["side.type = '%1'", _player_side]],
	"",
	true
] call DB_fnc_select;

_res
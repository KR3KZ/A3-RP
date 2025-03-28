/*
* A3-RP
* Server-side
* file: select_players.sqf
* desc: Select players in database and return result
* usage: [_player_uid, _player_side] call SRV_fnc_select_players;
*/

params [
	["_player_uid", "", [""]],
	["_player_side", "", [""]]
];

if (_player_uid == "" || _player_side == "") exitWith {};

private _res = [
	[
		"account",
		"player",
		"side"
	],
	[
		"player.id",
		"player.name",
		"player.alive",
		"player.state",
		"player.cash",
		"player.gear",
		"player.pos_atl_x",
		"player.pos_atl_y",
		"player.pos_atl_z",
		"player.dir",
		"player.first_login"
	],
	[
		"player.account_id = account.id",
		"player.side_id = side.id",
		format["steam_id = '%1'", _player_uid],
		format["side.type = '%1'", _player_side]
	]
] call DB_fnc_select;

_res
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

private _query = format["
	SELECT player.id,
	player.money,
	player.pos_atl_x,
	player.pos_atl_y,
	player.pox_atl_z
	FROM account, player, side
	WHERE player.account_id = account.id
	AND player.side_id = side.id
	AND steam_id = '%1'
	AND side.type = '%2'
", _player_uid, _player_side];

private _res = [_query] call DB_fnc_select;

_res
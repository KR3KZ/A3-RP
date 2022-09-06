/*
* A3-RP
* Server-side
* file: update_player.sqf
* desc: Update player in database
*/

private _defaultHashMap = createHashMap;
private _players_infos 	= param [0, _defaultHashMap, [_defaultHashMap]];

if (
	_players_infos get "client_id" == 0 ||
	{ _players_infos get "client_side" == "" } ||
	{ _players_infos get "client_gear" == "" } ||
	{ _players_infos get "client_pos" isEqualTo []}
) exitWith {};

private _res = [
	"player",
	[
		format["cash = %1", _players_infos get "client_cash"],
		format["gear = '%1'", _players_infos get "client_gear"],
		format["pos_atl_x = %1", _players_infos get "client_pos" select 0],
		format["pos_atl_y = %1", _players_infos get "client_pos" select 1],
		format["pos_atl_z = %1", _players_infos get "client_pos" select 2],
		format["dir = %1", _players_infos get "client_dir"]
	],
	[
		format["id = %1", _players_infos get "client_id"],
		format["side_id = (SELECT id FROM side WHERE type = '%1')", _players_infos get "client_side"]
	]
] call DB_fnc_update;

_res
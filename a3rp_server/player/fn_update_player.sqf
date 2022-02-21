/*
* A3-RP
* Server-side
* file: update_player.sqf
* desc: Update player in database
*/

params [
	["_player_id", 0, [0]],
	["_player_side", "", [""]],
	["_player_cash", 0, [0]],
	["_player_gear", "", [""]],
	["_player_pos", [], [[]]],
	["_player_dir", 0, [0]]
];

if (_player_id == 0 || { _player_side == "" } || { _player_gear == "" } || { _player_pos isEqualTo [] }) exitWith {};

private _res = [
	"player",
	[
		format["cash = %1", _player_cash],
		format["gear = '%1'", _player_gear],
		format["pos_atl_x = %1", _player_pos select 0],
		format["pos_atl_y = %1", _player_pos select 1],
		format["pos_atl_z = %1", _player_pos select 2],
		format["dir = %1", _player_dir]
	],
	[
		format["id = %1", _player_id],
		format["side_id = (SELECT id FROM side WHERE type = '%1')", _player_side]
	]
] call DB_fnc_update;

_res
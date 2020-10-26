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

private _query = format ["
	UPDATE player SET
	cash = %1, gear = '%2', pos_atl_x = '%3', pos_atl_y = '%4', pos_atl_z = '%5', dir = '%6'
	WHERE id = %7 AND side_id = (SELECT id FROM side WHERE type = '%8')
", _player_cash, _player_gear, _player_pos select 0, _player_pos select 1, _player_pos select 2, _player_dir, _player_id, _player_side];

private _res = [_query] call DB_fnc_execute;

_res
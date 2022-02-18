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

private _res = [
	"player",
	["account_id", "side_id", "name", "cash", "gear"],
	[
		format["(SELECT id FROM ACCOUNT WHERE steam_id = '%1')", _player_uid],
		format["(SELECT id FROM side WHERE type = '%1')", _player_side],
		format["%1", _player_name],
		format["%1", _player_gear]
	]
] call DB_fnc_insert;

_res
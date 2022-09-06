/**
* A3-RP
* Server-side
* file: insert_building_key.sqf
* desc: Insert building key in database
*/

params [
	["_building_id", 0, [0]],
	["_client_player_id", 0, [0]]
];

if (_building_id == 0 || _client_player_id == 0) exitWith {};

private _res = [
	"building_key",
	[
		"building_id",
		"player_id"
	],
	[
		format["%1", _building_id],
		format["%1", _client_player_id]
	]
] call DB_fnc_insert;

_res
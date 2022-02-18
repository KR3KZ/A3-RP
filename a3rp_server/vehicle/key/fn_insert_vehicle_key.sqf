/**
* A3-RP
* Server-side
* file: insert_vehicle_key.sqf
* desc: Insert vehicle key in database
*/

params [
	["_vehicle_id", 0, [0]],
	["_client_player_id", 0, [0]]
];

if (_vehicle_id == 0 || { _client_player_id == 0 }) exitWith {};

private _res = [
	"vehicle_key",
	["vehicle_id", "player_id"],
	[
		format["%1", _vehicle_id],
		format["%1", _client_player_id]
	]
] call DB_fnc_insert;

_res
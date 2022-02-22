/**
* A3-RP
* Server-side
* file: select_vehicles_keys.sqf
* desc: Select vehicles keys in database
*/

private _vehicle_id = param [0, 0, [0]];

if (_vehicle_id == 0) exitWith {};

private _res = [
	["vehicle_key"],
	["vehicle_key.player_id"],
	[format["vehicle_key.vehicle_id = %1", _vehicle_id]]
] call DB_fnc_select;

_res
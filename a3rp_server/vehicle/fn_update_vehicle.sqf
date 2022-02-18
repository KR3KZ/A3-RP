/**
* A3-RP
* Server-side
* file: update_vehicle.sqf
* desc: Update vehicle in database
*/

params [
	["_vehicle_id", 0, [0]],
	["_vehicle_damage", "", [""]],
	["_vehicle_fuel", 0, [0]],
	["_vehicle_pos", [], [[]]],
	["_vehicle_dir", 0, [0]]
];

if (_vehicle_id == 0 || { _vehicle_damage == "" } || { _vehicle_pos isEqualTo [] }) exitWith {};

private _res = [
	"vehicle",
	[
		format["damage = %1", _vehicle_damage],
		format["fuel = %1", _vehicle_fuel],
		format["pos_atl_x = %1", _vehicle_pos select 0],
		format["pos_atl_y = %1", _vehicle_pos select 1],
		format["pos_atl_z = %1", _vehicle_pos select 2],
		format["dir = %1", _vehicle_dir]
	],
	[format["id = %1", _vehicle_id]]
] call DB_fnc_update;

_res
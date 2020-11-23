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

private _query = format ["
	UPDATE vehicle SET
	damage = '%1', fuel = '%2', pos_atl_x = '%3', pos_atl_y = '%4', pos_atl_z = '%5', dir = '%6'
	WHERE id = %7
", _vehicle_damage, _vehicle_fuel, _vehicle_pos select 0, _vehicle_pos select 1, _vehicle_pos select 2, _vehicle_dir, _vehicle_id];

private _res = [_query] call DB_fnc_execute;

_res
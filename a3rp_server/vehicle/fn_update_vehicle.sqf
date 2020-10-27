/**
* A3-RP
* Server-side
* file: update_vehicle.sqf
* desc: Update vehicle in database
*/

params [
	["_vehicle_id", 0, [0]],
	["_vehicle_damage", "", [""]],
	["_vehicle_pos", [], [[]]],
	["_vehicle_dir", 0, [0]]
];

private _query = format ["
	UPDATE vehicle SET
	damage = '%1', pos_atl_x = '%2', pos_atl_y = '%3', pos_atl_z = '%4', dir = '%5'
	WHERE id = %6
", _vehicle_damage, _vehicle_pos select 0, _vehicle_pos select 1, _vehicle_pos select 2, _vehicle_dir, _vehicle_id];

private _res = [_query] call DB_fnc_execute;

_res
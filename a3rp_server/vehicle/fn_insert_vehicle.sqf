/**
* A3-RP
* Server-side
* file: insert_vehicle.sqf
* desc: Insert a vehicle in the database
*/

params [
	["_vehicle_classname", "", [""]],
	["_vehicle_damage", "", [""]],
	["_vehicle_pos", [], [[]]],
	["_vehicle_dir", 0, [0]]
];

if (_vehicle_classname == "" || { _vehicle_damage == "" } || { _vehicle_pos isEqualTo [] }) exitWith {};

private _query = format ["
	INSERT INTO vehicle
	(classname, damage, pos_atl_x, pos_atl_y, pos_atl_z, dir)
	VALUES
	('%1', '%2', '%3', '%4', '%5', '%6')
", _vehicle_classname, _vehicle_damage, _vehicle_pos select 0, _vehicle_pos select 1, _vehicle_pos select 2, _vehicle_dir
];

[_query] call DB_fnc_execute;

/**
* Get the id of the vehicle and returns it
*/
private _res = ["SELECT LAST_INSERT_ID()"] call DB_fnc_process_select;

_res
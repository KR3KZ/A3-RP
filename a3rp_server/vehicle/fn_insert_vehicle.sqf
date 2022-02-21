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

[
	"vehicle",
	["classname", "damage", "pos_atl_x", "pos_atl_y", "pos_atl_z", "dir"],
	[
		format["'%1'", _vehicle_classname],
		format["'%1'", _vehicle_damage],
		format["%1", _vehicle_pos select 0],
		format["%1", _vehicle_pos select 1],
		format["%1", _vehicle_pos select 2],
		format["%1", _vehicle_dir]
	]
] call DB_fnc_insert;

/**
* Get the id of the vehicle and returns it
*/
private _res = ["SELECT LAST_INSERT_ID()"] call DB_fnc_process_select;

_res
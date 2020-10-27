/**
* A3-RP
* Server-side
* file: insert_vehicle.sqf
* desc: Insert vehicle in database
*/

params [
	["_vehicle_classname", "", [""]],
	["_vehicle_damage", "", [""]]
];

private _query = format ["
	INSERT INTO vehicle
	(classname, damage)
	VALUES
	('%1', '%2')
", _vehicle_classname, _vehicle_damage];

[_query] call DB_fnc_execute;

private _res = ["SELECT LAST_INSERT_ID()"] call DB_fnc_select;

_res
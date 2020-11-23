/**
* A3-RP
* Server-side
* file: insert_building_directory.sqf
* desc: Insert a building in the database
*/

params [
	["_building_classname", "", [""]],
	["_building_buyable", 0, [0]]
];

private _query = format ["
	INSERT INTO building_directory
	(classname, buyable)
	VALUES
	('%1', '%2')
", _building_classname, _building_buyable
];

[_query] call SRV_fnc_log_me;

private _res = [_query] call DB_fnc_execute;

_res
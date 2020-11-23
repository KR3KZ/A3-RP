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

if (_building_classname == "") exitWith {};

private _query = format ["
	INSERT INTO building_directory
	(classname, buyable)
	VALUES
	('%1', '%2')
", _building_classname, _building_buyable
];

private _res = [_query] call DB_fnc_execute;

_res
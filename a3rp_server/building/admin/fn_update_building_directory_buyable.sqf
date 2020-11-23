/**
* A3-RP
* Server-side
* file: set_building_buyable.sqf
* desc: Set buyable state of a building in the database
*/

params [
	["_building_classname", "", [""]],
	["_building_buyable", 0, [0]]
];

private _query = format ["
	UPDATE building_directory SET
	buyable = '%1'
	WHERE classname = '%2'
", _building_classname, _building_buyable];

private _res = [_query] call DB_fnc_execute;

_res
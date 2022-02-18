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

private _res = [
	"building_directory",
	["classname", "buyable"],
	[
		format["%1", _building_classname],
		format["%1", _building_buyable]
	]
] call DB_fnc_insert;

_res
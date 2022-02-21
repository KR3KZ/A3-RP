/**
* A3-RP
* Server-side
* file: set_building_directory_buyable.sqf
* desc: Set buyable state of a building in the database
*/

params [
	["_building_classname", "", [""]],
	["_building_buyable", 0, [0]]
];

if (_building_classname == "") exitWith {};

private _res = [
	"building_directory",
	[format["buyable = %1", _building_buyable]],
	[format["classname = '%1'", _building_classname]]
] call DB_fnc_update;

_res
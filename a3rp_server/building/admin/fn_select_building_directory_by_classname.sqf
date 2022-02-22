/*
* A3-RP
* Server-side
* file: select_building_directory_by_classname.sqf
* desc: Select building directory in database
*/

private _classname = param [0, "", [""]];

if (_classname == "") exitWith {[]};

private _res = [
	["building_directory"],
	["building_directory.classname", "building_directory.buyable"],
	[format["classname = '%1'", _classname]]
] call DB_fnc_select;

_res
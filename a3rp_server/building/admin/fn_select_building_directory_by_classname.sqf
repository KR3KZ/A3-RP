/*
* A3-RP
* Server-side
* file: select_building_directory_by_classname.sqf
* desc: Select building directory in database
*/

private _classname = param [0, "", [""]];

if (_classname == "") exitWith {};

private _query = format["
	SELECT building_directory.classname,
	building_directory.buyable
	FROM building_directory
	WHERE classname = '%1'
", _classname];

private _res = [_query, true] call DB_fnc_select;

_res
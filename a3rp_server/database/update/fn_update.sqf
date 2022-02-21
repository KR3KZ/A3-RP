/**
* A3-RP
* Server-side
* file: process_update.sqf
* desc: Process a update query
*/

params [
	["_tableName", "", [""]],
	["_updateFields", [], [[]]],
	["_conditions", [], [[]]]
];

if (_tableName == "" || { _updateFields isEqualTo [] }) exitWith {""};

private _query = [_tableName, _updateFields, _conditions] call DB_fnc_prepare_update;

if (_query == "") exitWith {""};

private _res = [_query] call DB_fnc_execute;

_res
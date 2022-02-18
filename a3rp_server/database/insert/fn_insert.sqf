/**
* A3-RP
* Server-side
* file: process_insert.sqf
* desc: Process a insert query
*/

params [
	["_tableName", "", [""]],
	["_insertFields", [], [[]]],
	["_values", [], [[]]]
];

if (_tableName == "" || { _insertFields isEqualTo [] } || { _values isEqualTo [] }) exitWith {""};

private _query = [_tableName, _insertFields, _values] call DB_fnc_prepare_insert;

if (_query == "") exitWith {};

private _res = [_query] call DB_fnc_execute;

_res
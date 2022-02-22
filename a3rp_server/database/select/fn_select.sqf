/**
* A3-RP
* Server-side
* file: select.sqf
* desc: Handle select query
* _tableName is an array of string (tables names)
* _selectFields is an array of string (fields names)
* _conditions is an array of string (conditions)
* _options is a string that contain SQL command like LIMIT, ORDER BY, etc...
*/

params [
	["_tableName", [], [[]]],
	["_selectFields", [], [[]]],
	["_conditions", [], [[]]],
	["_options", "", [""]]
];

if (_tableName isEqualTo [] || { _selectFields isEqualTo [] } || { _conditions isEqualTo [] }) exitWith {};

private _query = [_tableName, _selectFields, _conditions, _options] call DB_fnc_prepare_select;

if (_query == "") exitWith {};

private _selectResults = [_query] call DB_fnc_process_select;

private _res = [_selectFields, _selectResults] call SRV_fnc_hashmap;

_res
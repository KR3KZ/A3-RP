/**
* A3-RP
* Server-side
* file: prepare_insert.sqf
* desc: Prepare a insert query
*/

params [
	["_tableName", "", [""]],
	["_insertFields", [], [[]]],
	["_values", [], [[]]]
];

if (_tableName == "" || { _insertFields isEqualTo [] } || { _values isEqualTo [] }) exitWith {""};

_insertFields 	= _insertFields joinString ", ";
_values 		= _values joinString ", ";

private _res = format["INSERT INTO %1 (%2) VALUES (%3);", _tableName, _insertFields, _values];

_res
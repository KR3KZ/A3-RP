/**
* A3-RP
* Server-side
* file: prepare_select.sqf
* desc: Prepare a select query
*/

params [
	["_tableName", [], [[]]],
	["_selectFields", [], [[]]],
	["_conditions", [], [[]]],
	["_options", "", [""]]
];

if (_tableName isEqualTo [] || { _selectFields isEqualTo [] } || { _conditions isEqualTo [] }) exitWith {""};

_tableName 		= _tableName joinString ", ";
_selectFields 	= _selectFields joinString ", ";
_conditions 	= _conditions joinString " AND ";

private _res = format["SELECT %1 FROM %2 WHERE %3 %4;", _selectFields, _tableName, _conditions, _options];

_res
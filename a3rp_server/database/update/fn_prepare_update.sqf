/**
* A3-RP
* Server-side
* file: prepare_update.sqf
* desc: Prepare a update query
*/

params [
	["_tableName", "", [""]],
	["_updateFields", [], [[]]],
	["_conditions", [], [[]]]
];

if (_tableName == "" || { _updateFields isEqualTo [] }) exitWith {""};

_updateFields 	= _updateFields joinString ", ";
_conditions 	= _conditions joinString " AND ";

private _res = format["UPDATE %1 SET %2 WHERE %3;", _tableName, _updateFields, _conditions];

_res
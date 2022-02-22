/*
* A3-RP
* Server-side
* file: hashmap.sqf
* desc: Create and return a hashmap
*/

params [
	["_selectFields", [], [[]]],
	["_selectResults", [], [[]]]
];

private _hashmap = createHashMap;
{
	_hashmap set [_x, []]; 
} forEach _selectFields;

{
	_i = 0;
	{
		_hashmap get (_selectFields select _i) pushBack _x;
		_i = _i + 1;
	} forEach _x;
} forEach _selectResults;

[format["[SRV_fnc_hashmap] hashmap is: %1", _hashmap]] call SRV_fnc_log_me;

_hashmap
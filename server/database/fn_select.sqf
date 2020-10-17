/**
* A3-RP
* Server-side
* file: select.sqf
*/

params [
	["_query", "", [""]],
	["_multiArray", false, [false]]
];

/**
* Send query to SQL server.
* CALL_TYPE
*	0 = Sync  
*	1 = ASync (Doesnt save/return results, use for updating DB Values)  
*	2 = ASync + Save (Returns ID, for use with 5)
*	4 = Get (Retrieve Single Part Message)
*	5 = Get (Retrieves Multi-Msg Message)
*	9 = System Commands

* Returned Message Format
* [TYPE,DATA]
* TYPE
*	0 = ERROR 		(When Error encounter, data = basic info)  
*	1 = OK
*	2 = ID 			(ID = ID for ASYNC / Multi-part Message)  
*	3 = WAIT 		(WAIT, means extDB3 hasn't got result yet)  
*	5 = MULTIMSG 	(When you call 4: it will return [5] if message is Multi-part) 
*/
private _select 	= "extDB3" callExtension format ["2:%1:%2", call SRV_extdb3_protocol_name, _query];
_select 			= call compile format ["%1", _select];
private _type 		= _select select 0;
private _data 		= _select select 1;

/**
* Query extdb3 until we get all the data we want in _queryResult
*/
private _queryResult = "extDB3" callExtension format ["4:%1", _data];
if (_queryResult isEqualTo "[3]") then {
	for "_i" from 0 to 1 step 0 do {
		if (!(_queryResult isEqualTo "[3]")) exitWith {};
		_queryResult = "extDB3" callExtension format ["4:%1", _data];
	};
};

/**
* (When you call 4: it will return [5] if message is Multi-part) 
*/
if (_queryResult isEqualTo "[5]") then {
	_loop = true;
	for "_i" from 0 to 1 step 0 do {
		_queryResult = "";
		for "_i" from 0 to 1 step 0 do {
			_pipe = "extDB3" callExtension format ["5:%1", _data];
			if (_pipe isEqualTo "") exitWith {_loop = false};
			_queryResult = _queryResult + _pipe;
		};
		if (!_loop) exitWith {};
	};
};

/**
* We have our _queryResult like this (example):
* "[1,[[1,'salutlol'],[2,'sdf'],[3,'sdf'],[4,'ffff'],[5,'6xwc54xcv']]]"
* Compile it to get an array
*/
_queryResult = call compile _queryResult;

/**
* If MariaDBQueryException Exception
*/
if ((_queryResult select 0) isEqualTo 0) exitWith {
	[format ["[extDB3]: [%1]", _queryResult]] call SRV_fnc_log_me;
	//Return [0,"Error MariaDBQueryException Exception"]
	_queryResult
};

private _return = (_queryResult select 1);
if (!_multiArray && count _return > 0) then {
	_return = (_return select 0);
};

[format ["[extDB3]: [%1] >>> [%2]", _query, _return]] call SRV_fnc_log_me;

_return
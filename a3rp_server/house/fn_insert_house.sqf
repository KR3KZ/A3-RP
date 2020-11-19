/**
* A3-RP
* Server-side
* file: insert_house.sqf
* desc: Insert a house in the database
*/

params [
	["_house_classname", "", [""]],
	["_house_pos", [], [[]]]
];

private _query = format ["
	INSERT INTO house
	(classname, pos_atl_x, pos_atl_y, pos_atl_z)
	VALUES
	('%1', '%2', '%3', '%4')
", _house_classname, _house_pos select 0, _house_pos select 1, _house_pos select 2
];

[_query] call DB_fnc_execute;

/**
* Get the id of the house and returns it
*/
private _res = ["SELECT LAST_INSERT_ID()"] call DB_fnc_select;

_res
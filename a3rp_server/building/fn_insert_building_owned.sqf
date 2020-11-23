/**
* A3-RP
* Server-side
* file: insert_building_owned.sqf
* desc: Insert a building in the database
*/

params [
	["_building_classname", "", [""]],
	["_building_pos", [], [[]]]
];

private _query = format ["
	INSERT INTO building_owned
	(building_id, pos_atl_x, pos_atl_y, pos_atl_z)
	VALUES
	(SELECT id FROM building_directory WHERE classname = '%1', '%2', '%3', '%4')
", _building_classname, _building_pos select 0, _building_pos select 1, _building_pos select 2
];

[_query] call DB_fnc_execute;

/**
* Get the id of the building and returns it
*/
private _res = ["SELECT LAST_INSERT_ID()"] call DB_fnc_select;

_res
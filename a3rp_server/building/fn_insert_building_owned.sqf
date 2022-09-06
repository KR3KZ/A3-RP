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

if (_building_classname == "" || _building_pos isEqualTo []) exitWith {};

[
	"building_owned",
	[
		"building_directory_id",
		"pos_atl_x",
		"pos_atl_y",
		"pos_atl_z"
	],
	[
		format["(SELECT id FROM building_directory WHERE classname = '%1')", _building_classname],
		format["%1", _building_pos select 0],
		format["%1", _building_pos select 1],
		format["%1", _building_pos select 2]
	]
] call DB_fnc_insert;


/**
* Get the id of the building and returns it
*/
private _res = ["SELECT LAST_INSERT_ID()"] call DB_fnc_process_select;

_res
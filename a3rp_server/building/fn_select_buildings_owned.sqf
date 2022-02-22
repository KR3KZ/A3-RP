/**
* A3-RP
* Server-side
* file: select_buildings_owned.sqf
* desc: Select buildings in database
*/

private _res = [
	["building_directory", "building_owned"],
	["building_owned.id", "building_directory.classname", "building_owned.pos_atl_x", "building_owned.pos_atl_y", "building_owned.pos_atl_z"],
	["building_directory.id = building_owned.building_directory_id"],
	""
] call DB_fnc_select;

_res
/**
* A3-RP
* Server-side
* file: select_buildings_owned.sqf
* desc: Select buildings in database
*/

private _query = format["
	SELECT building_owned.id,
	building_directory.classname,
	building_owned.pos_atl_x,
	building_owned.pos_atl_y,
	building_owned.pos_atl_z
	FROM building_directory, building_owned
	WHERE building_directory.id = building_owned.building_id
"];

private _res = [_query, true] call DB_fnc_select;

_res
/**
* A3-RP
* Server-side
* file: select_buildings.sqf
* desc: Select buildings in database
*/

private _query = format["
	SELECT building.id,
	building.classname,
	building.pos_atl_x,
	building.pos_atl_y,
	building.pos_atl_z
	FROM building
"];

private _res = [_query, true] call DB_fnc_select;

_res
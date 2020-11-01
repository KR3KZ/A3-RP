/**
* A3-RP
* Server-side
* file: select_vehicles.sqf
* desc: Select vehicles in database
*/

private _query = format["
	SELECT vehicle.id,
	vehicle.classname,
	vehicle.damage,
	vehicle.pos_atl_x,
	vehicle.pos_atl_y,
	vehicle.pos_atl_z,
	vehicle.dir
	FROM vehicle
	WHERE vehicle.alive = 1
	AND vehicle.stored = 0
"];

private _res = [_query, true] call DB_fnc_select;

_res
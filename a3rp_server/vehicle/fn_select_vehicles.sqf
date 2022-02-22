/**
* A3-RP
* Server-side
* file: select_vehicles.sqf
* desc: Select vehicles in database
*/

private _res = [
	["vehicle"],
	["vehicle.id", "vehicle.classname", "vehicle.damage", "vehicle.fuel", "vehicle.pos_atl_x", "vehicle.pos_atl_y", "vehicle.pos_atl_z", "vehicle.dir"],
	["vehicle.alive = 1", "vehicle.stored = 0"],
	""
] call DB_fnc_select;

_res
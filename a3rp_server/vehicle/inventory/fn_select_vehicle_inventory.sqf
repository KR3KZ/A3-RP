/**
* A3-RP
* Server-side
* file: select_vehicle_inventory.sqf
* desc: Select vehicle inventory in database
*/

private _vehicle_id = param [0, 0, [0]];

private _query = format["
	SELECT backpacks, items, magazines, weapons
	FROM vehicle_inventory
	WHERE vehicle_id = '%1'
", _vehicle_id];

private _res = [_query, true] call DB_fnc_select;

_res select 0
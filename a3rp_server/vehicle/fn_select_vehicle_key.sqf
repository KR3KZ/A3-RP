/**
* A3-RP
* Server-side
* file: select_vehicles_keys.sqf
* desc: Select vehicles keys in database
*/

private _vehicle_id = param [0, 0, [0]];

private _query = format["
	SELECT vehicle_key.player_id
	FROM vehicle_key
	WHERE vehicle_key.vehicle_id = %1
", _vehicle_id];

private _res = [_query, true] call DB_fnc_select;

_res select 0
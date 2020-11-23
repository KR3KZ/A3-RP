/**
* A3-RP
* Server-side
* file: select_building_keys.sqf
* desc: Select building keys in database
*/

private _building_id = param [0, 0, [0]];

if (_building_id == 0) exitWith {};

private _query = format["
	SELECT building_key.player_id
	FROM building_key
	WHERE building_key.building_id = %1
", _building_id];

private _res = [_query, true] call DB_fnc_select;

_res
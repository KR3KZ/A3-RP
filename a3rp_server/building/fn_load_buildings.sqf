/**
* A3-RP
* Server-side
* file: load_buildings.sqf
* desc: Load buildings from database
*/

private _buildings = call SRV_fnc_select_buildings;

{
	private _building_id 			= _x select 0;
	private _building_classname 	= _x select 1;
	private _building_pos 			= [_x select 2, _x select 3, _x select 4];
	private _building_keys 			= [_building_id] call SRV_fnc_select_building_key;
	private _building				= nearestObject [_building_pos, _building_classname];
	[_building] call SRV_fnc_lock_building;

	_building setVariable ["building_id", _building_id, true];
	_building setVariable ["building_keys", _building_keys, true];
} forEach _buildings;
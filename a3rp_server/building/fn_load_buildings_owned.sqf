/**
* A3-RP
* Server-side
* file: load_buildings_owned.sqf
* desc: Load owned buildings from database
*/

private _buildings = call SRV_fnc_select_buildings_owned;

for "_i" from 0 to (count (_buildings get "building_owned.id") - 1) do {
	private _building_id 			= _buildings get "building_owned.id" select _i;
	private _building_classname 	= _buildings get "building_directory.classname" select _i;
	private _building_pos 			= [_buildings get "building_owned.pos_atl_x" select _i, _buildings get "building_owned.pos_atl_y" select _i, _buildings get "building_owned.pos_atl_z" select _i];
	private _building_keys 			= [_building_id] call SRV_fnc_select_building_key get "building_key.player_id";
	private _building				= nearestObject [_building_pos, _building_classname];
	[_building] call SRV_fnc_lock_building;

	_building setVariable ["building_id", _building_id, true];
	_building setVariable ["building_keys", _building_keys, true];
};
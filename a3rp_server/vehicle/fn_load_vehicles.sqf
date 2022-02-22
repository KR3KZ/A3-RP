/**
* A3-RP
* Server-side
* file: load_vehicles.sqf
* desc: Load vehicles from database
*/

private _vehicles = call SRV_fnc_select_vehicles;

for "_i" from 0 to (count (_vehicles get "vehicle.id") - 1) do {
	private _vehicle_id 		= _vehicles get "vehicle.id" select _i;
	private _vehicle_classname 	= _vehicles get "vehicle.classname" select _i;
	private _vehicle_damage 	= parseSimpleArray(_vehicles get "vehicle.damage" select _i);
	private _vehicle_fuel 		= _vehicles get "vehicle.fuel" select _i;
	private _vehicle_pos 		= [_vehicles get "vehicle.pos_atl_x" select _i, _vehicles get "vehicle.pos_atl_y" select _i, _vehicles get "vehicle.pos_atl_z" select _i];
	private _vehicle_dir 		= _vehicles get "vehicle.dir" select _i;

	private _vehicle 			= [_vehicle_classname, _vehicle_pos, _vehicle_dir] call SRV_fnc_create_vehicle;
	[_vehicle] call SRV_fnc_remove_items_from_vehicle;

	private _vehicle_keys 		= [_vehicle_id] call SRV_fnc_select_vehicle_key get "vehicle_key.player_id";
	private _vehicle_inventory	= [_vehicle_id] call SRV_fnc_select_vehicle_inventory;

	[
		_vehicle, 
		[
			_vehicle_inventory get "backpacks" select 0,
			_vehicle_inventory get "items" select 0,
			_vehicle_inventory get "magazines" select 0,
			_vehicle_inventory get "weapons" select 0
		]
	] call SRV_fnc_set_vehicle_inventory;

	_vehicle setVariable ["vehicle_id", _vehicle_id, true];
	_vehicle setVariable ["vehicle_keys", _vehicle_keys, true];

	[_vehicle, _vehicle_damage] call SRV_fnc_set_vehicle_damage;
	_vehicle setFuel _vehicle_fuel;
};
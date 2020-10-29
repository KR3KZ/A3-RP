/**
* A3-RP
* Server-side
* file: on_update_vehicle.sqf
* desc: Call update vehicle in database
*/

private _vehicle 		= param [0, objNull, [objNull]];
private _vehicle_id 	= _vehicle getVariable "vehicle_id";
private _vehicle_damage = str(getAllHitPointsDamage _vehicle select 2);
private _vehicle_pos 	= getPosATL _vehicle;
private _vehicle_dir 	= getDir _vehicle;

[_vehicle_id, _vehicle_damage, _vehicle_pos, _vehicle_dir] call SRV_fnc_update_vehicle;
/**
* A3-RP
* Server-side
* file: on_insert_vehicle.sqf
* desc: Call insert vehicle in database
*/

params [
	["_player", objNull, [objNull]],
	["_vehicle", objNull, [objNull]]
];

private _vehicle_damage = str(getAllHitPointsDamage _vehicle);

[format["[fn_on_insert_vehicle]: Request from [%1] [%2] [%3] received", getPlayerUID _player, side _player, name _player]] call SRV_fnc_log_me;

private _res = [_vehicle_damage] call SRV_fnc_insert_vehicle;

_vehicle setVariable ["vehicle_id", parseNumber(_res select 2), 2];
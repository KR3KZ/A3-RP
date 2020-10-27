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

private _vehicle_classname 	= typeOf _vehicle;
private _vehicle_damage 	= str(getAllHitPointsDamage _vehicle);
private _client_player_id	= _player getVariable "client_player_id";

[format["[fn_on_insert_vehicle]: Request from [%1] [%2] [%3] received", getPlayerUID _player, side _player, name _player]] call SRV_fnc_log_me;

private _res = [_vehicle_classname, _vehicle_damage] call SRV_fnc_insert_vehicle;

private _vehicle_id = _res select 0;

private _res2 = [_vehicle_id, _client_player_id] call SRV_fnc_insert_vehicle_key;

_vehicle setVariable ["vehicle_id", _vehicle_id, true];
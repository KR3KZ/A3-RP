/**
* A3-RP
* Server-side
* file: insert_vehicle_key.sqf
* desc: Insert vehicle key in database
*/

params [
	["_vehicle_id", 0, [0]],
	["_client_player_id", 0, [0]]
];

if (_vehicle_id == 0 || { _client_player_id == 0 }) exitWith {};

private _query = format ["
	INSERT INTO vehicle_key
	(vehicle_id, player_id)
	VALUES
	('%1', '%2')
", _vehicle_id, _client_player_id];

private _res = [_query] call DB_fnc_execute;

_res
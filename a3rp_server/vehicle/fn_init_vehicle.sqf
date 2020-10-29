/*
* A3-RP
* Server-side
* file: init_vehicle.sqf
*/

params [
	["_player", objNull, [objNull]],
	["_vehicle_classname", "", [""]],
	["_vehicle_pos", [], [[]]],
	["_vehicle_dir", 0, [0]]
];

private _client_player_id = _player getVariable "client_player_id";

private _vehicle = [_vehicle_classname, _vehicle_pos, _vehicle_dir] call SRV_fnc_create_vehicle;
private _vehicle_id = [_client_player_id, _vehicle] call SRV_fnc_on_insert_vehicle;
_vehicle setVariable ["vehicle_id", _vehicle_id, true];
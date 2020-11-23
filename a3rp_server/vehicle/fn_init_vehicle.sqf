/*
* A3-RP
* Server-side
* file: init_vehicle.sqf
* desc: Initialize a vehicle. Insert it in database. Create it. Set the vars needed.
*/

params [
	["_player", objNull, [objNull]],
	["_vehicle_classname", "", [""]],
	["_vehicle_pos", [], [[]]],
	["_vehicle_dir", 0, [0]]
];

if (isNull _player || { _vehicle_classname == "" } || { _vehicle_pos isEqualTo [] }) exitWith {};

private _client_player_id 	= _player getVariable "client_player_id";

private _vehicle 			= [_vehicle_classname, _vehicle_pos, _vehicle_dir] call SRV_fnc_create_vehicle;
[_vehicle] call SRV_fnc_remove_items_from_vehicle;
private _vehicle_id 		= [_client_player_id, _vehicle] call SRV_fnc_on_insert_vehicle;
private _vehicle_keys 		= [_vehicle_id] call SRV_fnc_select_vehicle_key;
private _vehicle_inventory	= [_vehicle_id] call SRV_fnc_select_vehicle_inventory;
[_vehicle, _vehicle_inventory] call SRV_fnc_set_vehicle_inventory;

_vehicle setVariable ["vehicle_id", _vehicle_id, true];
_vehicle setVariable ["vehicle_keys", _vehicle_keys, true];
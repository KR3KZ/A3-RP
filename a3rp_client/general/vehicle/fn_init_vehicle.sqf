/*
* A3-RP
* Client-side
* file: init_vehicle.sqf
*/

params [
	["_player", objNull, [objNull]],
	["_vehicle_classname", "", [""]],
	["_vehicle_pos", [], [[]]],
	["_vehicle_dir", 0, [0]]
];

if (isNull _player || { _vehicle_classname == "" } || { _vehicle_pos isEqualTo [] }) exitWith {};

[_player, _vehicle_classname, _vehicle_pos, _vehicle_dir] remoteExec ["SRV_fnc_init_vehicle", 2];
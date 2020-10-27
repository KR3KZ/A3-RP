/*
* A3-RP
* Client-side
* file: insert_vehicle.sqf
*/

private _vehicle = param [0, objNull, [objNull]];

if (_vehicle getVariable["vehicle_id", 0] == 0) then {
	["[fn_insert_vehicle]: Asking server to insert a new vehicle"] call client_fnc_log_me;
	[player, _vehicle] remoteExec ["SRV_fnc_on_insert_vehicle", 2];
} else {
	["[fn_insert_vehicle]: Vehicle already created"] call client_fnc_log_me;
};
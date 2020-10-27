/*
* A3-RP
* Client-side
* file: update_vehicle.sqf
*/

private _vehicle = param [0, objNull, [objNull]];

if (_vehicle getVariable["vehicle_id", 0] != 0) then {
	["[fn_update_vehicle]: Asking server to update a vehicle"] call client_fnc_log_me;
	[_vehicle] remoteExec ["SRV_fnc_on_update_vehicle", 2];
} else {
	["[fn_update_vehicle]: Vehicle isnt created"] call client_fnc_log_me;
};
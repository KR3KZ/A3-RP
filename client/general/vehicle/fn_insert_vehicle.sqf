/*
* A3-RP
* Client-side
* file: insert_vehicle.sqf
*/

private _vehicle = param [0, objNull, [objNull]];

["[fn_insert_vehicle]: Asking server to insert a new vehicle"] call client_fnc_log_me;
[player, _vehicle] remoteExec ["SRV_fnc_on_insert_vehicle", 2];
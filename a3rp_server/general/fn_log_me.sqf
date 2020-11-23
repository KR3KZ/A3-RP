/*
* A3-RP
* Server-side
* file: log_me.sqf
*/

private _string = param [0, "", [""]];

if (_string == "") exitWith {};

diag_log "=========================== A3RP ===========================";
diag_log format ["[%1] " + _string, SRV_log_me_id];
SRV_log_me_id = SRV_log_me_id + 1;
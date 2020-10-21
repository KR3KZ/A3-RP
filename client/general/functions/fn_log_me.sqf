/*
* A3-RP
* Client-side
* file: log_me.sqf
* desc: Log every thing and keep the count
*/

private _string = param [0, "", [""]];

diag_log "=========================== A3RP ===========================";
diag_log format ["[%1] [client] " + _string, client_log_me_id];
systemChat format ["[%1] [client] " + _string, client_log_me_id];
client_log_me_id = client_log_me_id + 1;
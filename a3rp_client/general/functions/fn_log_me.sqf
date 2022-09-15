/*
* A3-RP
* Client-side
* file: log_me.sqf
* desc: Log every thing and keep the count
*/

private _config 		= missionConfigFile >> "A3RP_Settings";
private _debug_mode 	= getNumber (_config >> "debug_mode");

if (_debug_mode isEqualTo 1) then {
	private _string = param [0, "", [""]];

	if (_string == "") exitWith {};

	diag_log "=========================== A3RP ===========================";
	diag_log format ["[%1] [client] " + _string, client_log_me_id];
	systemChat format ["[%1] [client] " + _string, client_log_me_id];
	client_log_me_id = client_log_me_id + 1;
};
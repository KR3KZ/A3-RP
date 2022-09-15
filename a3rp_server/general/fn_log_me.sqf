/*
* A3-RP
* Server-side
* file: log_me.sqf
* desc: Log every thing and keep the count
*/

private _config 		= missionConfigFile >> "A3RP_Settings";
private _debug_mode 	= getNumber (_config >> "debug_mode");

if (_debug_mode isEqualTo 1) then {
	private _string = param [0, "", [""]];

	if (_string == "") exitWith {};

	diag_log "=========================== A3RP ===========================";
	diag_log format ["[%1] " + _string, SRV_log_me_id];
	SRV_log_me_id = SRV_log_me_id + 1;
};
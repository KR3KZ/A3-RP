/*
* A3-RP
* Server-side
* file: log_me.sqf
*/

private _string = param [0, "", [""]];

/**
* If _string is not a string, stringify it
*/
if (!(_string isEqualType "")) then {
	_string = str(_string);
};

diag_log "=========================== A3RP ===========================";
diag_log format ["[%1] " + _string, SRV_log_me_id];
SRV_log_me_id = SRV_log_me_id + 1;
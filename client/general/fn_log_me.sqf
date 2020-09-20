/*
* A3-RP
* Client-side
* file: log_me.sqf
* desc: Log every thing and keep the count
*/

private _string = param [0, ""];

/**
* If _string is not a string, stringify it
*/
if (!(_string isEqualType "")) then {
	_string = str(_string);
};

diag_log "=========================== A3RP ===========================";
diag_log format ["[%1] " + _string, CLI_log_me_id];
CLI_log_me_id = CLI_log_me_id + 1;
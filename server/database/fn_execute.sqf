/**
* A3-RP
* Server-side
* file: execute.sqf
*/

private _query = param [0, ""];

private _execute = "extDB3" callExtension format ["1:%1:%2", call SRV_extdb3_protocol_name, _query];

[format ["[extDB3]: [%1] >>> [%2]", _query, _execute]] call SRV_fnc_log_me;
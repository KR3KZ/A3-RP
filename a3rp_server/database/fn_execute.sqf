/**
* A3-RP
* Server-side
* file: execute.sqf
* desc: Execute given query
*/

private _query = param [0, "", [""]];

private _execute = "extDB3" callExtension format ["2:%1:%2", call SRV_extdb3_protocol_name, _query];

[format ["[extDB3]: [%1] >>> [%2]", _query, _execute]] call SRV_fnc_log_me;

/**
* Return extDB3 answer so we know when the query has been executed, however we don't know if the query succeeded or failed
*/
_execute
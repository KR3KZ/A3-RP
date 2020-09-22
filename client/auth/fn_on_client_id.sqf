/**
* A3-RP
* Client-side
* file: on_client_id.sqf
* desc: Get the client id for this account from the server
*/

private _client_id = param [0, 0, [0]];
_client_id = format ["%1", _client_id];

[format["[fn_on_client_id]: client_id received from server [%1]", _client_id]] call client_fnc_log_me;

/**
* Setting the client_id var, no one but server can access it
*/
player setVariable ["client_id", _client_id, 2];

client_id_received = compileFinal("true");
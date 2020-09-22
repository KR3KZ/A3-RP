/**
* A3-RP
* Client-side
* file: on_client_id.sqf
* desc: Get the client id from the server and set it
*/

private _client_id = param [0, "", [""]];

[format["[fn_on_client_id]: client_id received from server [%1]", _client_id]] call client_fnc_log_me;

/**
* Setting the client_id var, no one but server can access it
*/
player setVariable ["client_id", _client_id, 2];

client_id_received = compileFinal("true");
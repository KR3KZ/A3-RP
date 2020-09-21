/**
* A3-RP
* Client-side
* file: on_client_id.sqf
* desc: Get the client id from the server and set it
*/

private _client_id = param [0, "", [""]];

[format["[fn_ask]: Client_id received from server [%1]", _client_id]] call client_fnc_log_me;

client_id = compileFinal(_client_id);
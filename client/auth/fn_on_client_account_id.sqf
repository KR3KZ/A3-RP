/**
* A3-RP
* Client-side
* file: on_client_account_id.sqf
* desc: Get the client id for this account from the server
*/

private _client_account_id 	= param [0, 0, [0]];
_client_account_id 			= format ["%1", _client_account_id];

[format["[fn_on_client_account_id]: client_account_id received from server [%1]", _client_account_id]] call client_fnc_log_me;

/**
* Setting the client_account_id var, no one but server can access it
*/
player setVariable ["client_account_id", _client_account_id, 2];

client_account_id_received 	= true;
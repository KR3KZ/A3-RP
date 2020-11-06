/**
* A3-RP
* Client-side
* file: ask_account.sqf
* desc: Ask the server if the account is in the database
*/

["[fn_ask_account]: Sending request to the server"] call client_fnc_log_me;
[player] remoteExec ["SRV_fnc_on_ask_account", 2];
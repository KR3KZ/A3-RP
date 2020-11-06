/**
* A3-RP
* Client-side
* file: ask_players.sqf
* desc: Ask the server if the account has player in the database
*/

["[fn_ask_players]: Sending request to the server"] call client_fnc_log_me;
[player] remoteExec ["SRV_fnc_on_ask_players", 2];
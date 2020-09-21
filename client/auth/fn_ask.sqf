/**
* A3-RP
* Client-side
* file: ask.sqf
* desc: Ask the server if the player is already in the database
*/

["[fn_ask]: Sending auth request to the server"] call client_fnc_log_me;
[player] remoteExec ["SRV_fnc_on_ask", 2];
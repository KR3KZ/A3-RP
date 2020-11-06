/**
* A3-RP
* Client-side
* file: update_player.sqf
* desc: Ask the server to update the player in databse
*/

["[fn_update_player]: Sending request to the server"] call client_fnc_log_me;
[player] remoteExec ["SRV_fnc_on_update_player", 2];
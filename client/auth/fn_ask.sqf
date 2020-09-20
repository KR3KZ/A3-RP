/**
* A3-RP
* Client-side
* file: ask.sqf
* desc: Ask the server if the player is already in the database
*/

[player] remoteExec ["SRV_fnc_on_ask", 2];
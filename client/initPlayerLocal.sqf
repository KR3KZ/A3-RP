/**
* A3-RP
* Client-side
* file: initPlayerLocal.sqf (https://community.bistudio.com/wiki/Event_Scripts#initPlayerLocal.sqf)
* desc: Handle auth and variables for the player. Executed after initServer.sqf
*/

/**
* Black screen
*/
0 cutText["Chargement...", "BLACK FADED", 99999999];

CLI_log_me_id = 0;

/**
* Wait until the server is ready
*/
waitUntil {call SRV_is_ready};

/**
* TODO :
* 	Query database to create a player OR if it already exist, select it
*/
[] call AUT_fnc_ask;





/**
* Remove black screen
*/
0 cutText ["", "BLACK IN"];

["[client]: The server is ready!"] call CLI_fnc_log_me;
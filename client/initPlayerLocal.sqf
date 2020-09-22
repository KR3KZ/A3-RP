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

client_log_me_id = 0;
client_id_received = compile("false");

["Server is loading..."] call client_fnc_log_me;

/**
* Wait until the server is ready
*/
waitUntil {call SRV_is_ready};
["The server is ready"] call client_fnc_log_me;

/**
* Ask database if account exist, if not, create it, then send back client ID
*/
["Asking account to the server..."] call client_fnc_log_me;
[] call auth_fnc_ask_account;
waitUntil {call client_id_received};
["The account is ready"] call client_fnc_log_me;

/**
* Ask database if account has existing players in database
*/
["Asking players's account to server..."] call client_fnc_log_me;
[] call auth_fnc_ask_players;

/**
* Remove black screen
*/
0 cutText ["", "BLACK IN"];

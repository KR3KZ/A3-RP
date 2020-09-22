/**
* A3-RP
* Client-side
* file: on_players_list.sqf
* desc: Get the players list for this account from the server
*/

private _players_list = param [0, [], [[]]];

[format["[fn_on_players_list]: Players list received from server [%1]", _players_list]] call client_fnc_log_me;
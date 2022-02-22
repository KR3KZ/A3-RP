/**
* A3-RP
* Client-side
* file: on_players_list.sqf
* desc: Get the players list for this account from the server
*/

private _defaultHashMap = createHashMap;

private _players_list 	= param [0, _defaultHashMap, [_defaultHashMap]];

if (_players_list get "player.id" isEqualTo []) exitWith {};

[format["[fn_on_players_list]: Players list received from server [%1]", _players_list]] call client_fnc_log_me;

client_players_list 			= _players_list;
client_players_list_received 	= true;
/**
* A3-RP
* Client-side
* file: on_player_created.sqf
* desc: Get the player just created for this account from the server
*/

private _defaultHashMap = createHashMap;

private _players 		= param [0, _defaultHashMap, [_defaultHashMap]];

[format["[fn_on_player_created]: Player created received from server [%1]", _players]] call client_fnc_log_me;

/**
* Add the player we just created in the player list so we can see it in the dialog
*/
client_players_list = _players;

/**
* Close and open the dialog to refresh it
*/
closeDialog 0;
waitUntil{!dialog};
createDialog "A3RP_player_list";
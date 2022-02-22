/**
* A3-RP
* Client-side
* file: on_player_created.sqf
* desc: Get the player just created for this account from the server
*/

private _defaultHashMap = createHashMap;

private _player 		= param [0, _defaultHashMap, [_defaultHashMap]];

if (!("player.id" in _player) || {_player get "player.id" isEqualTo []}) exitWith {
	/**
	* Player already exist in database with that name
	*/
	[format[localize "STR_player_already_exists", name player]] spawn BIS_fnc_guiMessage;
};

[format["[fn_on_player_created]: Player created received from server [%1]", _player]] call client_fnc_log_me;

/**
* Add the player we just created in the player list so we can see it in the dialog
*/
client_players_list pushBack (_player);

/**
* Close and open the dialog to refresh it
*/
closeDialog 0;
waitUntil{!dialog};
createDialog "A3RP_player_list";
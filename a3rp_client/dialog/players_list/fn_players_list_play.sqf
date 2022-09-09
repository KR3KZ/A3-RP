/**
* A3-RP
* Client-side
* file: players_list_play
* desc: Select a character from the client_players_list
*/

["[fn_players_list_play]: Button play pressed"] call client_fnc_log_me;

private _display 	= findDisplay 1000;
private _name 		= _display displayCtrl 1001;

if (name player == ctrlText(_name)) then {
	/**
	* If the player has the same name as the character displayed in the dialog, he can play
	*/
	closeDialog 0;

	client_player = createHashMap;
	{
		client_player set [_x, ((client_players_list get _x) select client_players_list_index)];
	} forEach client_players_list;

	client_player_selected 	= true;
	[format["[fn_players_list_play]: Player selected: [%1]", client_players_list]] call client_fnc_log_me;

	/**
	* Variables used by server
	*/
	player setVariable ["client_spawned", true, 2];
	player setVariable ["client_player_id", client_players_list get "player.id" select client_players_list_index, 2];
	player setVariable ["client_cash", client_players_list get "player.cash" select client_players_list_index, 2];

	/**
	* Apply ace medical state
	*/
	[player, client_player get "player.state"] call ace_medical_fnc_deserializeState
} else {
	/**
	* If the name of the player doesn't match with the name in the dialog, he can't play, he must modify his name in his Arma profile
	*/
	[format[localize "STR_player_already_exists", name player]] spawn BIS_fnc_guiMessage;
};
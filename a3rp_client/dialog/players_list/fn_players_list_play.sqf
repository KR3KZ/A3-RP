/**
* A3-RP
* Client-side
* file: players_list_play
* desc: Select player from players_list
*/

["[fn_players_list_play]: Button play pressed"] call client_fnc_log_me;

private _display 	= findDisplay 1000;
private _name 		= _display displayCtrl 1001;

if (name player == ctrlText(_name)) then {
	/**
	* If the player has the same name as the character displayed in the dialog, he can play
	*/
	closeDialog 0;
	/**
	* client_player contains informations about the selected character
	*/
	client_player 			= client_players_list select client_players_list_index;
	player setVariable ["client_player_id", client_player select 0, 2];
	player setVariable ["client_cash", client_player select 2, 2];
	client_player_position 	= [client_player select 4, client_player select 5, client_player select 6];
	client_player_dir		= client_player select 7;
	client_player_selected 	= true;
	[format["[fn_players_list_play]: Player selected: [%1]", client_player]] call client_fnc_log_me;
} else {
	/**
	* If the name of the player doesn't match with the name in the dialog, he can't play, he must modify his name in his Arma profile
	*/
	[format[localize "STR_player_already_exists", name player]] spawn BIS_fnc_guiMessage;
};
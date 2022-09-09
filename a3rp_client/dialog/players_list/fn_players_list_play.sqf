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
	client_player = createHashMap;
	{
		client_player set [_x, ((client_players_list get _x) select client_players_list_index)];
	} forEach client_players_list;

	client_player_selected 	= true;
	[format["[fn_players_list_play]: Player selected: [%1]", client_players_list]] call client_fnc_log_me;
	
	closeDialog 0;
} else {
	/**
	* If the name of the player doesn't match with the name in the dialog, he can't play, he must modify his name in his Arma profile
	*/
	[format[localize "STR_player_already_exists", name player]] spawn BIS_fnc_guiMessage;
};
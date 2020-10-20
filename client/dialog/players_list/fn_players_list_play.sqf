/**
* A3-RP
* Client-side
* file: players_list_play
* desc: Select player from players_list
*/

["[fn_players_list_play]: Button play pressed"] call client_fnc_log_me;

private _display 		= findDisplay 1000;
private _name 			= _display displayCtrl 1001;

if (name player == ctrlText(_name)) then {
	closeDialog 0;
	client_player 			= client_players_list select client_players_list_index;
	client_player_position 	= [client_player select 4, client_player select 5, client_player select 6];
	client_player_selected 	= true;
	[format["[fn_players_list_play]: Player selected: [%1]", client_player]] call client_fnc_log_me;
} else {
	[format[localize "STR_player_already_exists", name player]] spawn BIS_fnc_guiMessage;
};
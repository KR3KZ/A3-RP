/**
* A3-RP
* Client-side
* file: players_list_play
* desc: Select player from players_list
*/

["[fn_players_list_play]: Button play pressed"] call client_fnc_log_me;

closeDialog 0;
client_player 			= compileFinal(str((call client_players_list) select client_players_list_index));
client_player_position 	= [(call client_player) select 4, (call client_player) select 5, (call client_player) select 6];
client_player_selected 	= compileFinal("true");

[format["[fn_players_list_play]: Player selected: [%1]", client_player]] call client_fnc_log_me;
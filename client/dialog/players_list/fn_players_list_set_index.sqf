/**
* A3-RP
* Client-side
* file: players_list_set
* desc: Select player from players_list
*/

private _param = param [0, true, [true]];

if (client_players_list_index_max == 0) exitWith {};

if (_param) then {
	["[fn_players_list_on_set]: Button next pressed"] call client_fnc_log_me;
	if ((client_players_list_index + 1) > client_players_list_index_max) then {
		client_players_list_index = 0;
	} else {
		client_players_list_index = client_players_list_index + 1;
	};
} else {
[	"[fn_players_list_on_set]: Button prev pressed"] call client_fnc_log_me;
	if ((client_players_list_index - 1) < 0) then {
		client_players_list_index = client_players_list_index_max;
	} else {
		client_players_list_index = client_players_list_index - 1;
	};
};

[client_players_list_index] spawn client_fnc_players_list_set_ctrl;

[format["[fn_players_list_set]: %1", client_players_list_index]] call client_fnc_log_me;
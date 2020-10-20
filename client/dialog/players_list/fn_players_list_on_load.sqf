/**
* A3-RP
* Client-side
* file: players_list_on_load
* desc: Select player from players_list on load
*/

["[fn_players_list_on_load]: Dialog created"] call client_fnc_log_me;

private _display 				= findDisplay 1000;
waitUntil {!isNull _display};
_display displayAddEventHandler["keyDown", {if (_this # 1 == 1) then {true};}];

[0] spawn client_fnc_players_list_set_ctrl;

client_players_list_index 		= 0;
client_players_list_index_max 	= (count(client_players_list) - 1);
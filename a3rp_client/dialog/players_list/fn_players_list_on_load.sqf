/**
* A3-RP
* Client-side
* file: players_list_on_load
* desc: Character selection dialog
*/

["[fn_players_list_on_load]: Dialog created"] call client_fnc_log_me;

private _display 				= findDisplay 1000;

waitUntil {!isNull _display};

/**
* Prevent dialog from closing with esc key
*/
_display displayAddEventHandler["keyDown", {if (_this # 1 == 1) then {true};}];

/**
* Display the information for the character at client_players_list select 0
*/
[0] spawn client_fnc_players_list_set_ctrl;

client_players_list_index 		= 0;
client_players_list_index_max 	= (count(client_players_list) - 1);
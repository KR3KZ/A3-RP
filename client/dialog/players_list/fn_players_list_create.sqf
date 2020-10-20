/**
* A3-RP
* Client-side
* file: players_list_create
* desc: Create player
*/

["[fn_players_list_create]: Button create pressed"] call client_fnc_log_me;

private _result = [format [localize "STR_player_create_message", name player], localize "STR_player_create_title", localize "STR_player_create", true] call BIS_fnc_guiMessage;

if (_result) then {
	[player] remoteExec ["SRV_fnc_on_create_player", 2];
};
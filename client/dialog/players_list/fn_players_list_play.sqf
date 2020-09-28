/**
* A3-RP
* Client-side
* file: players_list_play
* desc: Select player from players_list
*/

["[fn_players_list_play]: Button play pressed"] call client_fnc_log_me;

/**
* Cut cam
*/
player setVariable ["client_cam_intro_running", false];

private _display = findDisplay 1000;
private _btn_play = _display displayCtrl 1005;
private _btn_prev = _display displayCtrl 1006;
private _btn_next = _display displayCtrl 1007;

_btn_play ctrlSetText localize "STR_loading";

{
	_x ctrlEnable false;
} forEach [_btn_play, _btn_prev, _btn_next];

client_player = compileFinal(str((call client_players_list) select client_players_list_index));

[format["[fn_players_list_play]: Player selected: [%1]", client_player]] call client_fnc_log_me;
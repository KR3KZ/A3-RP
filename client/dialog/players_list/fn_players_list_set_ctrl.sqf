/**
* A3-RP
* Client-side
* file: players_list_set_ctrl
* desc: Select player from index
*/

private _index = param [0, 0, [0]];

private _display = findDisplay 1000;
waitUntil {!isNull _display};
private _name = _display displayCtrl 1001;
private _cash = _display displayCtrl 1002;
private _city = _display displayCtrl 1003;
private _sub_title = _display displayCtrl 1004;

private _player_info = (call client_players_list) select _index;

private _player_name = _player_info select 1;
private _player_cash = [_player_info select 2] call BIS_fnc_numberText;
_player_cash = format["%1 %2", _player_cash, localize "STR_money_sign"];
private _player_pos = [_player_info select 4, _player_info select 5, _player_info select 6];

_sub_title ctrlSetText format ["%1 / %2", (_index + 1), (client_players_list_index_max + 1)];
_name ctrlSetText _player_name;
_cash ctrlSetText _player_cash;

/**
* If player first spawn or died
*/
if (_player_pos isEqualTo [0,0,0]) then {
	_city ctrlSetText (localize "STR_spawn_unknown");
} else {
	_city ctrlSetText (text(nearestLocation [_player_pos, "nameCity"]));
};
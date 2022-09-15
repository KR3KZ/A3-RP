/**
* A3-RP
* Client-side
* file: players_list_set_ctrl
* desc: Select player from index
*/

private _index 			= param [0, -1, [0]];

if (_index == -1) exitWith {};

private _display 		= findDisplay 1000;
waitUntil {!isNull _display};
private _name 			= _display displayCtrl 1001;
private _cash 			= _display displayCtrl 1002;
private _city 			= _display displayCtrl 1003;
private _sub_title 		= _display displayCtrl 1004;
private _btn_play		= _display displayCtrl 1005;

private _player_name 	= client_players_list get "player.name" select _index;
private _player_cash 	= [client_players_list get "player.cash" select _index] call BIS_fnc_numberText;
_player_cash 			= format["%1 %2", _player_cash, localize "STR_money_sign"];
private _player_pos 	= [client_players_list get "player.pos_atl_x" select _index, client_players_list get "player.pos_atl_y" select _index, client_players_list get "player.pos_atl_z" select _index];

_sub_title ctrlSetText format ["%1 / %2", (_index + 1), (client_players_list_index_max + 1)];
_name ctrlSetText _player_name;
_cash ctrlSetText _player_cash;

/**
* Check player name
*/
if (name player != _player_name) then {
	/**
	* The name of the player doesn't match with the name in the dialog
	*/
	_btn_play ctrlEnable false;
	_btn_play ctrlSetTooltip format[localize "STR_player_change_your_name", _player_name, name player];
} else {
	if (!ctrlEnabled _btn_play) then {
		/**
		* If the button play was disabled, enabled it
		*/
		_btn_play ctrlEnable true;
	};
	_btn_play ctrlSetTooltip "";
};

/**
* Displays the city name in the dialog if the player position is not equal to [0,0,0]
*/
if (_player_pos isEqualTo [0,0,0]) then {
	_city ctrlSetText (localize "STR_spawn_unknown");
} else {
	_city ctrlSetText (text(nearestLocation [_player_pos, "NameCityCapital"]));
};
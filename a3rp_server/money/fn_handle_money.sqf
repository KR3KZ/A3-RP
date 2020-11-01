/*
* A3-RP
* Server-side
* file: handle_money.sqf
*/

params [
	["_player", objNull, [objNull]],
	["_cash", 0, [0]]
];

private _player_cash = _player getVariable ["client_cash", 0];

_cash = _player_cash + _cash;

if (_cash >= 0) then {
	_player setVariable ["client_cash", _cash, 2];
	[_player] call SRV_fnc_on_update_player;
	[format["[fn_handle_money]: [%1] [%2] [%3] [%4].", getPlayerUID _player, side _player, name _player, _cash]] call SRV_fnc_log_me;
} else {
	[format["[fn_handle_money]: Can't set negative money for [%1] [%2] [%3] [%4].", getPlayerUID _player, side _player, name _player, _cash]] call SRV_fnc_log_me;
};
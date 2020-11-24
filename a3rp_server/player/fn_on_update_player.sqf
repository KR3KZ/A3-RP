/*
* A3-RP
* Server-side
* file: on_update_player.sqf
* desc: The client ask to be updated in database
*/

private _player 		= param [0, objNull, [objNull]];

private _player_id 		= _player getVariable ["client_player_id", 0];
if (_player_id == 0) exitWith {};

/**
* This variable is used to not save the player when he hasn't spawn yet
*/
private _player_spawned = _player getVariable ["client_spawned", false];
if (!(_player_spawned)) exitWith {};

private _player_side 	= format["%1", side _player];

private _player_cash 	= _player getVariable ["client_cash", -1];
if (_player_cash == -1) exitWith {};

private _player_gear 	= format ["%1", getUnitLoadout _player];
private _player_pos 	= getPosATL _player;
private _player_dir		= getDir _player;

[format["[fn_on_update_player]: Request from [%1] [%2] received", _player_side, _player_id]] call SRV_fnc_log_me;

[_player_id, _player_side, _player_cash, _player_gear, _player_pos, _player_dir] call SRV_fnc_update_player;
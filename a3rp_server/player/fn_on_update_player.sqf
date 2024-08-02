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
//private _player_state	= [_player] call ace_medical_fnc_serializeState;

[format["[fn_on_update_player]: Request from [%1] [%2] received", _player_side, _player_id]] call SRV_fnc_log_me;

private _defaultHashMap = createHashMap;

_defaultHashMap set ["client_id", _player_id];
_defaultHashMap set ["client_side", _player_side];
_defaultHashMap set ["client_cash", _player_cash];
_defaultHashMap set ["client_gear", _player_gear];
_defaultHashMap set ["client_pos", _player_pos];
_defaultHashMap set ["client_dir", _player_dir];
//_defaultHashMap set ["client_state", _player_state];

[_defaultHashMap] call SRV_fnc_update_player;
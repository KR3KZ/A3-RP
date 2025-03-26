/*
* A3-RP
* Server-side
* file: on_create_player.sqf
* desc: The client asks to create a new character in database
*/

private _player 		= param [0, objNull, [objNull]];

if (isNull _player) exitWith {};

private _player_uid 	= getPlayerUID _player;
private _player_side 	= format["%1", side _player];
private _player_name 	= name _player;

[format["[fn_on_create_player]: Request from [%1] [%2] [%3] received", _player_uid, _player_side, _player_name]] call SRV_fnc_log_me;

private _res = [_player_uid, _player_side, _player_name] call SRV_fnc_select_player_by_name;

if !("player.id" in _res) exitWith {
	/**
	* If MariaDBQueryException Exception
	*/
	[format["[fn_on_create_player]: [%1]", _res]] call SRV_fnc_log_me;
};

if (_res get "player.id" isEqualTo []) then {
	[_player] call SRV_fnc_create_player;
} else {
	[format[localize "STR_player_already_exists", name _player]] remoteExec ["BIS_fnc_guiMessage", _player];
};
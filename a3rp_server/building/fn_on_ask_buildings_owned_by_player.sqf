/**
* A3-RP
* Server-side
* file: on_ask_buildings_owned_by_player.sqf
* desc: The player want to get the buildings he owns
*/

private _player 			= param [0, objNull, [objNull]];
private _player_uid 		= getPlayerUID _player;
private _player_side 		= format["%1", side _player];
private _player_name 		= name _player;
private _client_player_id 	= _player getVariable "client_player_id";

if (isNull _player) exitWith {};

[format["[fn_on_ask_buildings_owned_by_player]: [%1] [%2] [%3] want to get his building", _player_uid, _player_side, _player_name]] call SRV_fnc_log_me;

private _buildings = [_client_player_id] call SRV_fnc_select_buildings_owned_by_player;

[format["[fn_on_ask_buildings_owned_by_player]: [%1]", _buildings]] call SRV_fnc_log_me;

[_buildings] remoteExec ["client_fnc_spawn_menu_set_buildings", _player];
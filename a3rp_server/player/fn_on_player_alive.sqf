/*
* A3-RP
* Server-side
* file: on_player_alive.sqf
* desc: The client is alive, update it in database
*/

private _player = param [0, objNull, [objNull]];

if (isNull _player) exitWith {};

[_player, 1] call SRV_fnc_set_player_alive;
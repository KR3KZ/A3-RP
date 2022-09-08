/*
* A3-RP
* Server-side
* file: on_player_killed.sqf
* desc: The client was killed, update it in database
*/

private _player = param [0, objNull, [objNull]];

if (isNull _player) exitWith {};

[_player, 0] call SRV_fnc_set_player_alive;
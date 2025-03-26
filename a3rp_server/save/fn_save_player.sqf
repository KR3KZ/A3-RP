/*
* A3-RP
* Server-side
* file: save_player.sqf
*/

private _player = param [0, objNull, [objNull]];

if (!(isNull _player)) then {
	[_player] call SRV_fnc_on_update_player;
};
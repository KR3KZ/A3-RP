/*
* A3-RP
* Server-side
* file: load_gear.sqf
*/

params [
	["_player", objNull, [objNull]],
	["_gear", [], [[]]]
];

if (isNull _player || { _gear isEqualTo [] }) exitWith {};

_player setUnitLoadout _gear;

[format["[fn_teleport_me]: [%1] [%2] [%3] loaded gear [%4]", getPlayerUid _player, side _player, name _player, _gear]] call SRV_fnc_log_me;
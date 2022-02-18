/**
* A3-RP
* Server-side
* file: unlock_closest_building_door.sqf
* desc: Unlock closest door from the player
*/

params [
	["_player", objNull, [objNull]],
	["_building", objNull, [objNull]]
];

if (isNull _building || { isNull _player }) exitWith {};

private _door_id = [_player, _building] call SRV_fnc_get_closest_door_from_player;

if (_door_id == 0) exitWith {};

// _building animate [format["door_%1_rot", _door_id], 1]; This open the door, I don't want that
_building setVariable [format["bis_disabled_Door_%1", _door_id], 0, true];
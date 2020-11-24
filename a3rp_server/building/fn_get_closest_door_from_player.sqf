/**
* A3-RP
* Server-side
* file: get_closest_door_from_player.sqf
* desc: Get the closest door from the player
*/

params [
	["_player", objNull, [objNull]],
	["_building", objNull, [objNull]]
];

if (isNull _building || { isNull _player }) exitWith {};

private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "numberOfDoors");

if (_doors < 1) exitWith {0};

private _doors_arr 	= [];
private _player_pos	= getPosASL _player;

for "_i" from 1 to _doors do {
  _door_pos = _building modelToWorldWorld (_building selectionPosition format["Door_%1_trigger", _i]);
  _doors_arr pushBack [_player_pos distance _door_pos, _i];
};

_doors_arr sort true;
_doors_arr select 0 select 1;
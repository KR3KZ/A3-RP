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

if (_doors < 1) exitWith {};

/**
* Get the position (relative to the building then to the world) of the first door to use it in the for loop
*/
private _door_pos_1 = _building modelToWorld (_building selectionPosition "Door_1_trigger");

/**
* The distance between the player and the first door
*/
private _distance = (getPosATL _player) distance _door_pos_1;

/**
* Set the first door to be the closest one, and if a door is closer, override the variable
*/
private _closest_door = 1;
 
for "_i" from 1 to _doors do {
	/**
	* Get the door position relative to the building then to the world
	*/
	private _door_pos = _building modelToWorld (_building selectionPosition format["Door_%1_trigger", _i]);

	if (((getPosATL _player) distance _door_pos) < _distance) then {
		_distance = (getPosATL _player) distance _door_pos;
		_closest_door = _i;
	};
};

_closest_door
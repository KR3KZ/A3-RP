/**
* A3-RP
* Server-side
* file: unlock_building.sqf
* desc: Unlock a building
*/

private _building = param [0, objNull, [objNull]];

private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "numberOfDoors");
 
for "_i" from 1 to _doors do {
	//_building animate [format["door_%1_rot", _i], 1]; This open all the doors, I don't want that
    _building setVariable [format["bis_disabled_Door_%1", _i], 0, true];
};
/**
* A3-RP
* Server-side
* file: lock_building.sqf
* desc: Lock a building
*/

private _building = param [0, objNull, [objNull]];

private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "numberOfDoors");
 
for "_i" from 1 to _doors do {
    _building animate [format["door_%1_rot", _i], 0];
    _building setVariable [format["bis_disabled_Door_%1", _i], 1, true];
};
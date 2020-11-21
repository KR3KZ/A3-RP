/**
* A3-RP
* Server-side
* file: lock_vehicle.sqf
* desc: Lock a vehicle
*/

private _vehicle = param [0, objNull, [objNull]];

if ((locked _vehicle) isEqualTo 0) then {
	_vehicle lock 2;
};
/**
* A3-RP
* Server-side
* file: unlock_vehicle.sqf
* desc: Unlock a vehicle
*/

private _vehicle = param [0, objNull, [objNull]];

if ((locked _vehicle) isEqualTo 2) then {
	_vehicle lock 0;
};
/**
* A3-RP
* Server-side
* file: create_vehicle.sqf
* desc: Create a vehicle
*/

params [
	["_vehicle_classname", "", [""]],
	["_vehicle_pos", [], [[]]],
	["_vehicle_dir", 0, [0]]
];

if (_vehicle_classname == "" || { _vehicle_pos isEqualTo [] }) exitWith {};

private _vehicle = _vehicle_classname createVehicle [0, 0, 9999];
_vehicle setDir _vehicle_dir;
_vehicle setPos _vehicle_pos;

_vehicle
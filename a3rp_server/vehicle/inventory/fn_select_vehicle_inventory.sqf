/**
* A3-RP
* Server-side
* file: select_vehicle_inventory.sqf
* desc: Select vehicle inventory in database
*/

private _vehicle_id = param [0, 0, [0]];

if (_vehicle_id == 0) exitWith {};

private _res = [
	["vehicle_inventory"],
	["backpacks", "items", "magazines", "weapons"],
	[format["vehicle_id = %1", _vehicle_id]],
	""
] call DB_fnc_select;

_res
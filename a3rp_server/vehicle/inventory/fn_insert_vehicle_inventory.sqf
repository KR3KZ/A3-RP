/**
* A3-RP
* Server-side
* file: insert_vehicle_inventory.sqf
* desc: Insert vehicle inventory in database
*/

params [
	["_vehicle_id", 0, [0]],
	["_vehicle_backpacks", [], [[]]],
	["_vehicle_items", [], [[]]],
	["_vehicle_magazines", [], [[]]],
	["_vehicle_weapons", [], [[]]]
];

if (_vehicle_id == 0) exitWith {};

private _res = [
	"vehicle_inventory",
	["vehicle_id", "backpacks", "items", "magazines", "weapons"],
	[
		format["%1", _vehicle_id],
		format["%1", _vehicle_backpacks],
		format["%1", _vehicle_items],
		format["%1", _vehicle_magazines],
		format["%1", _vehicle_weapons]
	]
] call DB_fnc_insert;

_res
/**
* A3-RP
* Server-side
* file: update_vehicle_inventory.sqf
* desc: Call the update vehicle inventory in database
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
	[
		format["backpacks = %1", _vehicle_backpacks],
		format["items = %1", _vehicle_items],
		format["magazines = %1", _vehicle_magazines],
		format["weapons = %1", _vehicle_weapons]
	],
	[format["vehicle_id = %1", _vehicle_id]]
] call DB_fnc_update;

_res
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

private _query = format ["
	UPDATE vehicle_inventory SET
	backpacks = '%1', items = '%2', magazines = '%3', weapons = '%4'
	WHERE vehicle_id = %5
", _vehicle_backpacks, _vehicle_items, _vehicle_magazines, _vehicle_weapons, _vehicle_id];

private _res = [_query] call DB_fnc_execute;

_res
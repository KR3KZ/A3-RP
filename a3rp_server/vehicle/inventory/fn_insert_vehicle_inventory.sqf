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

private _query = format ["
	INSERT INTO vehicle_inventory
	(vehicle_id, backpacks, items, magazines, weapons)
	VALUES
	('%1', '%2', '%3', '%4', '%5')
", _vehicle_id, _vehicle_backpacks, _vehicle_items, _vehicle_magazines, _vehicle_weapons];

private _res = [_query] call DB_fnc_execute;

_res
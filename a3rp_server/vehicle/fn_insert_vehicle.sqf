/**
* A3-RP
* Server-side
* file: insert_vehicle.sqf
* desc: Insert vehicle in database
*/

params [
	["_vehicle_damage", "", [""]]
];

private _query = format ["
	INSERT INTO vehicle
	(damage)
	VALUES
	('%1')
", _vehicle_damage];

private _res = [_query] call DB_fnc_execute;

parseSimpleArray _res
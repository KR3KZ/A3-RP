/*
* A3-RP
* Client-side
* file: get_spawn_position.sqf
* desc: Get a random building around the given spawn and return his first buildingPos
*/

private _spawn 				= param [0, [], [[]]];

if (_spawn isEqualTo []) exitWith {};

private _spawn_marker_name 	= _spawn select 2;
private _buildings_spawn	= getArray(missionConfigFile >> "A3RP_Settings" >> "buildings_spawn");
private _buildings 			= nearestObjects [getMarkerPos _spawn_marker_name, _buildings_spawn, 200];
private _building 			= selectRandom(_buildings);

(_building buildingPos 0)
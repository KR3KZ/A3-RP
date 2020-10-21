/*
* A3-RP
* Client-side
* file: get_spawn_position.sqf
*/

private _spawn 		= param [0, [], [[]]];
private _buildings 	= nearestObjects [getMarkerPos (_spawn select 2), ["Land_i_Shop_01_V3_F"], 200];
private _building 	= _buildings call BIS_fnc_selectRandom;

getpos _building
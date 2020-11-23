/**
* A3-RP
* Server-side
* file: load_buildings_directory.sqf
* desc: Load building directory from database
*/

private _buildings_classname = call SRV_fnc_select_building_directory_by_classname;

{
	private _building_classname = _x select 0;
	private _building_buyable 	= _x select 1;
	private _center				= [worldSize / 2, worldSize / 2];
	private _radius				= worldSize / sqrt 2; // We also want the objets that are in the edges of the cercle!
	private _buildings			= nearestObjects [_center, [_building_classname], _radius];
	{
		_x setVariable ["building_buyable", _building_buyable, true];
	} forEach _buildings;
} forEach _buildings_classname;
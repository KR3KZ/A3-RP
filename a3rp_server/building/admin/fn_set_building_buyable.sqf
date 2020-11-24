/**
* A3-RP
* Server-side
* file: set_building_buyable.sqf
* desc: Set buyable state of a building
*/

params [
	["_building", objNull, [objNull]],
	["_buyable", false, [true]]
];

if (isNull _building) exitWith {};

if (_buyable) then {
	_buyable = 1;
} else {
	_buyable = 0;
};

private _building_classname = typeOf _building;
private _buildings_classname = [_building_classname] call SRV_fnc_select_building_directory_by_classname;

if (count(_buildings_classname) > 0) then {
	[_building_classname, _buyable] call SRV_fnc_update_building_directory_buyable;
} else {
	[_building_classname, _buyable] call SRV_fnc_insert_building_directory;
};
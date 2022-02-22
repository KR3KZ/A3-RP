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

if !(_buildings_classname get "building_directory.classname" isEqualTo []) then {
	[_building_classname get "building_directory.classname" select 0, _buyable] call SRV_fnc_update_building_directory_buyable;
} else {
	[_building_classname get "building_directory.classname" select 0, _buyable] call SRV_fnc_insert_building_directory;
};
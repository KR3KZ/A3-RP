/**
* A3-RP
* Server-side
* file: set_building_buyable.sqf
* desc: Set buyable state of a building
*/

params [
	["_building", objNull, [objNull]],
	["_buyable", 0, [0]]
];

if (isNull _building) exitWith {};

private _building_classname = typeOf _building;
private _building_exist = [_building_classname] call SRV_fnc_select_building_directory_by_classname;

if (count(_building_exist) != 0) then {
	[_building_classname, _buyable] call SRV_fnc_update_building_directory_buyable;
} else {
	[_building_classname, _buyable] call SRV_fnc_insert_building_directory;
};
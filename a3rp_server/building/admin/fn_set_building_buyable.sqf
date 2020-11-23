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

if !(isNull _building) then {
	private _building_classname = typeOf _building;
	if (_building getVariable ["building_buyable", -1] != -1) then {
		[_building_classname, _buyable] call SRV_fnc_update_building_directory_buyable;
	} else {
		[_building_classname, _buyable] call SRV_fnc_insert_building_directory;
	};

	_building setVariable ["building_buyable", _buyable, true];
};
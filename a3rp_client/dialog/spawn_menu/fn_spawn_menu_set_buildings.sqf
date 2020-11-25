/**
* A3-RP
* Client-side
* file: spawn_menu_set_buildings.sqf
* desc: Show building on spawn menu when the server send the building list
*/

private _buildings 		= param [0, [], [[]]];

if (_buildings isEqualTo []) exitWith {};

private _display 		= findDisplay 1100;
_display setVariable ["building_list", _buildings];

private _buildings_list = _display displayCtrl 1105;

{
	private _spawn_name = if (_x select 5 == "") then {
		getText (configFile >> "CfgVehicles" >> (_x select 1) >> "displayName");
	} else {
		_x select 5;
	};
	private _index = _buildings_list lbAdd _spawn_name;
	_buildings_list lbSetData [_index, str(_forEachIndex)];
} forEach _buildings;
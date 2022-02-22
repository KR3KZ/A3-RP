/**
* A3-RP
* Client-side
* file: spawn_menu_set_buildings.sqf
* desc: Display the buildings the player owns in the spawn menu when the server send it
*/

private _defaultHashMap = createHashMap;

private _buildings 		= param [0, _defaultHashMap, [_defaultHashMap]];

if (_buildings get "building_owned.id" isEqualTo []) exitWith {};

private _display 		= findDisplay 1100;
_display setVariable ["building_list", _buildings];

private _buildings_list = _display displayCtrl 1105;

for "_i" from 0 to (count (_buildings get "building_owned.id") - 1) do {
	private _spawn_name = if (_buildings get "building_owned.name" select _i == "") then {
		getText (configFile >> "CfgVehicles" >> (_buildings get "building_directory.classname" select _i) >> "displayName");
	} else {
		_buildings get "building_owned.name" select _i;
	};
	private _index = _buildings_list lbAdd _spawn_name;
	_buildings_list lbSetData [_index, str(_i)];
};
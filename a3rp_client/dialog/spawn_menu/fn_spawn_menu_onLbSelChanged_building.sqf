/**
* A3-RP
* Client-side
* file: spawn_menu_onLbSelChanged_building
* desc: Executed when a new selection is made in houses selection
*/

params ["_control", "_selectedIndex"];

private _display = ctrlParent _control;

_display setVariable ["spawn_type", "building"];

/**
* Get the text and data from selected spawn
*/
private _spawn_name 		= _control lbText (lbCurSel _control);
private _spawn_data 		= parseNumber(_control lbData (lbCurSel _control));
[format["[fn_spawn_menu_onLbSelChanged_building]: New selection : %1 : %2", _spawn_name, _spawn_data]] call client_fnc_log_me;

/**
* Get the spawn from _display getVariable "building_list"
*/
private _spawns				= _display getVariable ["building_list", []];

if (_spawns isEqualTo []) exitWith {};

private _spawn 				= _spawns select _spawn_data;

private _spawn_name = if (_spawn select 5 == "") then {
	getText (configFile >> "CfgVehicles" >> (_spawn select 1) >> "displayName");
} else {
	_spawn select 5;
};

private _map 				= _display displayCtrl 1101;
private _btn_spawn 			= _display displayCtrl 1103;
private _sub_title 			= _display displayCtrl 1104;

/**
* Update sub_title and button text
*/
_sub_title ctrlSetText (format[localize "STR_spawn_menu_selected_spawn", _spawn_name]);
_btn_spawn ctrlSetText (format[localize "STR_spawn_menu_spawn_at", _spawn_name]);

if (!ctrlEnabled _btn_spawn) then {
	_btn_spawn ctrlEnable true;
};

_map ctrlMapAnimAdd [0, 0.008, [_spawn select 2, _spawn select 3, _spawn select 4]];
ctrlMapAnimCommit _map;
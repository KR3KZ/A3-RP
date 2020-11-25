/**
* A3-RP
* Client-side
* file: spawn_menu_onLbSelChanged_spawn
* desc: Executed when a new selection is made in spawn selection
*/

params ["_control", "_selectedIndex"];

private _display 			= ctrlParent _control;
_display setVariable ["spawn_type", "spawn"];
private _spawns 			= call client_fnc_get_spawns;

/**
* Get the text and data from selected spawn
*/
private _spawn_name 		= _control lbText (lbCurSel _control);
private _spawn_data 		= parseNumber(_control lbData (lbCurSel _control));
[format["[fn_spawn_menu_onLbSelChanged_spawn]: New selection : %1 : %2", _spawn_name, _spawn_data]] call client_fnc_log_me;

/**
* Get the spawn from spawns with _spawn_data
*/
private _spawn 				= _spawns select _spawn_data;
private _spawn_marker 		= _spawn select 2;
private _spawn_marker_pos 	= getMarkerPos _spawn_marker;
[format["[fn_spawn_menu_onLbSelChanged_spawn]: Spawn marker : %1", _spawn_marker]] call client_fnc_log_me;

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

_map ctrlMapAnimAdd [0, 0.1, _spawn_marker_pos];
ctrlMapAnimCommit _map;
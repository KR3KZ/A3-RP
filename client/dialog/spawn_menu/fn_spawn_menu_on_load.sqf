/**
* A3-RP
* Client-side
* file: spawn_menu_on_load
* desc: Spawn selection dialog
*/

["[fn_spawn_menu_on_load]: Dialog created"] call client_fnc_log_me;

private _display 		= findDisplay 1100;

waitUntil {!isNull _display};

//_display displayAddEventHandler["keyDown", {if (_this # 1 == 1) then {true};}];

private _spawns = call client_fnc_get_spawns;

if (count(_spawns) < 1) exitWith {
	["[fn_spawn_menu_on_load]: No spawns in config."] call client_fnc_log_me;
};

[format["[fn_spawn_menu_on_load]: Spawns list : [%1]", _spawns]] call client_fnc_log_me;

private _spawns_list 	= _display displayCtrl 1102;
private _btn_spawn 		= _display displayCtrl 1103;

_btn_spawn ctrlEnable false;

{
	private _spawn_name = _x select 0;
	private _index = _spawns_list lbAdd _spawn_name;
	_spawns_list lbSetData [_index, str(_forEachIndex)];
} forEach _spawns;

_spawns_list lbSetCurSel 0;
ctrlSetFocus _btn_spawn;
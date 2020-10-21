/**
* A3-RP
* Client-side
* file: spawn_menu_spawn
* desc: Executed when spawn button is pressed
*/

private _display 		= findDisplay 1100;
private _spawns_list 	= _display displayCtrl 1102;
private _spawn_data 	= parseNumber(_spawns_list lbData (lbCurSel _spawns_list));
private _spawns 		= [] call client_fnc_get_spawns;
private _spawn 			= _spawns select _spawn_data;
[_spawn] call client_fnc_get_spawn_position;

[format["[fn_spawn_menu_spawn]: Selected spawn : %1", _spawn select 0]] call client_fnc_log_me;
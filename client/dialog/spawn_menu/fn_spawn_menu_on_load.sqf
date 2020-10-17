/**
* A3-RP
* Client-side
* file: spawn_menu_on_load
* desc: Select spawn map dialog
*/

["[fn_spawn_menu_on_load]: Dialog created"] call client_fnc_log_me;

private _spawns = [] call client_fnc_get_spawns;
private _display = findDisplay 1100;
waitUntil {!isNull _display};
//_display displayAddEventHandler["keyDown", {if (_this # 1 == 1) then {true};}];
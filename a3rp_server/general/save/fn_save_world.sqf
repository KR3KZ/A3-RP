/*
* A3-RP
* Server-side
* file: save_world.sqf
*/

["World saving..."] call SRV_fnc_log_me;

[] call SRV_fnc_save_players;
//TODO save vehicles

["World saved!"] call SRV_fnc_log_me;
/**
* A3-RP
* Client-side
* file: init.sqf
* desc:
*/

waitUntil {!isNull (findDisplay 46)};

if (createDialog "A3RP_player_list") then {
	[] call client_fnc_cam_intro;
};
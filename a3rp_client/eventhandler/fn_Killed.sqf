/**
* A3-RP
* Client-side
* file: Killed.sqf
* desc: Triggered when the unit is killed.
*/

player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit] remoteExec ["SRV_fnc_on_player_killed", 2];
}];
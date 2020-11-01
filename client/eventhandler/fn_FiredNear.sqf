/**
* A3-RP
* Client-side
* file: FiredNear.sqf
*/

player addEventHandler ["FiredNear", {
	params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];

	player setVariable ["client_fighting_time", time, false];

	if (player getVariable ["client_fighting", false]) exitWith {};

	player setVariable ["client_fighting", true, false];

	if (cameraView == "External") then {
		player switchCamera "Internal";
	};

	[] spawn {
		waitUntil {player getVariable "client_fighting_time" < time - 60};
		player setVariable ["client_fighting", false, false];
	};
}];
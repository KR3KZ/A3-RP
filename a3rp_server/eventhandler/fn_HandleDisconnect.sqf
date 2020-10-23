/**
* A3-RP
* Server-side
* file: HandleDisconnect.sqf
*/

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	[_unit] call SRV_fnc_on_update_player;
	[format["[HandleDisconnect]: [%1] [%2] [%3] disconnected.", _uid, side _unit, _name]] call SRV_fnc_log_me;
	false;
}];
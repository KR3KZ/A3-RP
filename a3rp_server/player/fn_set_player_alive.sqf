/*
* A3-RP
* Server-side
* file: set_player_alive.sqf
* desc: Update alive field in player table
*/

params [
	["_player", objNull, [objNull]],
	["_alive", 1, [0]]
];

if (isNull _player) exitWith {};

private _player_id = _player getVariable ["client_player_id", 0];
if (_player_id == 0) exitWith {};

[
	"player",
	[
		format["alive = %1", _alive]
	],
	[
		format["id = %1", _player_id],
		format["side_id = (SELECT id FROM side WHERE type = '%1')", side _player]
	]
] call DB_fnc_update;
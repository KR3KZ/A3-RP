/**
* A3-RP
* Server-side
* file: transfer_building.sqf
* desc: Transfer building
*/

params [
	["_player", objNull, [objNull]],
	["_building", objNull, [objNull]]
];

if (isNull _player || { isNull _building }) exitWith {};

private _client_player_id 		= _player getVariable "client_player_id";
private _building_id			= _building getVariable ["building_id", 0];

/**
* Is it a building ?
*/
if (!(_building isKindOf "House_F")) exitWith {
	[format["[fn_transfer_building]: [%1] is not a building", _building]] call SRV_fnc_log_me;
};

/**
* Building owned ?
*/
if (_building_id == 0) exitWith {
	[format["[fn_transfer_building]: [%1] has not been bought yet", _building]] call SRV_fnc_log_me;
};

[
	"building_key",
	[
		format["player_id = %1", _client_player_id],
	],
	[
		format["building_id = %1", _building_id];
	]
] call DB_fnc_update;
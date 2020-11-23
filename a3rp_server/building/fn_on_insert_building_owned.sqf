/**
* A3-RP
* Server-side
* file: on_insert_building_owned.sqf
* desc: Call insert building in database
*/

params [
	["_player", objNull, [objNull]],
	["_building", objNull, [objNull]]
];

if (!(_building isKindOf "House_F")) exitWith {
	[format["[fn_buy_building]: [%1] is not a building", _building]] call client_fnc_log_me;
};

if (_building getVariable ["building_id", 0] != 0) exitWith {
	[format["[fn_buy_building]: [%1] is already owned", _building]] call client_fnc_log_me;
};

private _client_player_id 	= _player getVariable "client_player_id";
private _building_classname = typeOf _building;
private _buyable = [_building_classname] call SRV_fnc_select_building_directory_by_classname;

private _building_pos		= getPosATL _building;

private _res 				= [_building_classname, _building_pos] call SRV_fnc_insert_building_owned;
private _building_id 		= _res select 0;
[_building_id, _client_player_id] call SRV_fnc_insert_building_key;
private _building_keys 		= [_building_id] call SRV_fnc_select_building_key;


_building setVariable ["building_id", _building_id, true];
_building setVariable ["building_keys", _building_keys, true];

_building_id
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

if (isNull _player || { isNull _building }) exitWith {};

private _client_player_id 		= _player getVariable "client_player_id";

/**
* Is it a building ?
*/
if (!(_building isKindOf "House_F")) exitWith {
	[format["[fn_buy_building]: [%1] is not a building", _building]] call SRV_fnc_log_me;
};

/**
* Building already owned
*/
if (_building getVariable ["building_id", 0] != 0) exitWith {
	[format["[fn_buy_building]: [%1] is already owned", _building]] call SRV_fnc_log_me;
};

private _building_classname 	= typeOf _building;

/**
* Check if the building is buyable
*/
private _buildings_classname 	= [_building_classname] call SRV_fnc_select_building_directory_by_classname;

if (building_directory get "building_directory.classname" isEqualTo []) exitWith {
	/**
	* Building not whitelisted in database (table building_directory)
	*/
	[format["[fn_buy_building]: [%1] can't be bought, because it's not whitelisted", _building]] call SRV_fnc_log_me;
};

/**
* Building is whitelisted but buyable is on 0
*/
if (_buildings_classname get "building_directory.buyable" select 0 != 1) exitWith {
	[format["[fn_buy_building]: [%1] can't be bought, because it's not whitelisted", _building]] call SRV_fnc_log_me;
};

private _building_pos		= getPosATL _building;

/**
* Insert the building in database (table building_owned)
*/
private _res 				= [_building_classname, _building_pos] call SRV_fnc_insert_building_owned;
private _building_id 		= _res select 0;

/**
* Insert the key in database (table building_key)
*/
[_building_id, _client_player_id] call SRV_fnc_insert_building_key;

/**
* Select  the key in database (table building_key)
*/
private _building_keys 		= [_building_id] call SRV_fnc_select_building_key get "building_key.player_id";

_building setVariable ["building_id", _building_id, true];
_building setVariable ["building_keys", _building_keys, true];

[_building] call SRV_fnc_lock_building;

_building_id
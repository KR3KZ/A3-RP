/*
* A3-RP
* Client-side
* file: buy_building.sqf
*/

private _building = param [0, objNull, [objNull]];

if (!(_building isKindOf "House_F")) exitWith {
	[format["[fn_buy_building]: [%1] is not a building", _building]] call client_fnc_log_me;
};

if (_building getVariable ["building_id", 0] != 0) exitWith {
	[format["[fn_buy_building]: [%1] is already owned", _building]] call client_fnc_log_me;
};

[player, _building] remoteExec ["SRV_fnc_on_insert_building_owned", 2];

[format["[fn_buy_building]: Asking server to buy [%1]", _building]] call client_fnc_log_me;
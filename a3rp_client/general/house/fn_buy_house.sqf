/*
* A3-RP
* Client-side
* file: buy_house.sqf
*/

private _house = param [0, objNull, [objNull]];

[player, _house] remoteExec ["SRV_fnc_on_insert_house", 2];

[format["[fn_buy_house]: Asking server to buy [%1]", _house]] call client_fnc_log_me;
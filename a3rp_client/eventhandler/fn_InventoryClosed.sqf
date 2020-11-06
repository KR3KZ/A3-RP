/**
* A3-RP
* Client-side
* file: InventoryClosed.sqf
*/

player addEventHandler ["InventoryClosed", {
	params ["_unit", "_container"];
	[format["[InventoryClosed]: [%1]", _this]] call client_fnc_log_me;
}];
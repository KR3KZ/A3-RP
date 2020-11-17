/**
* A3-RP
* Client-side
* file: InventoryClosed.sqf
*/

player addEventHandler ["InventoryClosed", {
	params ["_unit", "_container"];
	[format["[InventoryClosed]: [%1]", _this]] call client_fnc_log_me;
	
	if (_container isKindOf "Car" || {_container isKindOf "Air"} || {_container isKindOf "Ship"}) then {
		/**
		* We need to update the inventory of the vehicle in database
		*/
		[_container] remoteExec ["SRV_fnc_on_update_vehicle_inventory", 2];
	};
}];
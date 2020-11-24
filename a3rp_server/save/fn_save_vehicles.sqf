/*
* A3-RP
* Server-side
* file: save_vehicles.sqf
*/

private _vehicles = vehicles;

{
	private _vehicle = _x;
	if (_vehicle getVariable ["vehicle_id", 0] != 0 && (!(isNull _vehicle))) then {
		[_vehicle] call SRV_fnc_on_update_vehicle;
	};
} forEach _vehicles;
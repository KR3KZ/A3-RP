/*
* A3-RP
* Client-side
* file: get_spawns.sqf
* desc: Get spawn list from config
*/

private _spawns_config 		= missionConfigFile >> "A3RP_Spawns" >> worldName >> str(side player);
private _spawns 			= [];

for "_i" from 0 to (count(_spawns_config) - 1) do {
	private _error			= false;
	private _spawn 			= [];
	private _spawnCfg 		= _spawns_config select _i;
	private _name 			= getText(_spawnCfg >> "name");

	if (_name == "") then {
		[format["[fn_get_spawns]: Bad [name] for [%1]", _spawnCfg]] call client_fnc_log_me;
		_error = true;
	};

	private _radius 		= getNumber(_spawnCfg >> "radius");
	private _marker_name 	= getText(_spawnCfg >> "marker_name");

	if (markerType _marker_name != "Empty") then {
		[format["[fn_get_spawns]: Bad [marker_name] for [%1]", _spawnCfg]] call client_fnc_log_me;
		_error = true;
	};

    private _conditions 	= getText(_spawnCfg >> "conditions");
	private _price 			= getNumber(_spawnCfg >> "price");
	
	if (!_error) then {
		_spawn = [_name, _radius, _marker_name, _conditions, _price];
		_spawns pushBack (_spawn);
	};
};

_spawns
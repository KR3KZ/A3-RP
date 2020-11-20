class CfgRemoteExec
{
	class Functions
	{
		mode = 1;
		jip = 0;

		//SRV
		class SRV_fnc_on_ask_account {allowedTargets = 2;};
		class SRV_fnc_on_ask_players {allowedTargets = 2;};
		class SRV_fnc_on_create_player {allowedTargets = 2;};
		class SRV_fnc_on_update_player {allowedTargets = 2;};
		class SRV_fnc_teleport_me {allowedTargets = 2;};
		class SRV_fnc_handle_money {allowedTargets = 2;};
		class SRV_fnc_init_vehicle {allowedTargets = 2;};
		class SRV_fnc_on_update_vehicle_inventory {allowedTargets = 2;};
		class SRV_fnc_load_gear {allowedTargets = 2;};
		class SRV_fnc_on_insert_building {allowedTargets = 2;};

		//CLIENT
		class auth_fnc_on_client_account_id {allowedTargets = 1;};
		class auth_fnc_on_players_list {allowedTargets = 1;};
		class auth_fnc_on_player_created {allowedTargets = 1;};
		class client_fnc_bad_name {allowedTargets = 1;};
		
		class bis_fnc_debugconsoleexec {allowedTargets = 0;};
	};

	class Commands
	{
		mode = 1;
	};
};
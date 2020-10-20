class CfgRemoteExec
{
	class Functions
	{
		mode = 1;
		jip = 0;

		class SRV_fnc_on_ask_account {allowedTargets = 2;};
		class SRV_fnc_on_ask_players {allowedTargets = 2;};
		class SRV_fnc_on_create_player {allowedTargets = 2;};
		class SRV_fnc_on_update_player {allowedTargets = 2;};
		class auth_fnc_on_client_account_id {allowedTargets = 1;};
		class auth_fnc_on_players_list {allowedTargets = 1;};
		class auth_fnc_on_player_created {allowedTargets = 1;};
		class bis_fnc_debugconsoleexec {allowedTargets = 0;};
	};

	class Commands
	{
		mode = 1;
	};
};
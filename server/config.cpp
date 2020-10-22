class CfgPatches
{
	class Server
	{
		requiredAddons[] = {"A3_Data_F"};
		fileName = "server.pbo";
		name = "A3-RP Server";
		author = "3rK";
	};
};

class CfgFunctions {
	class Sql {
		tag = "DB";
		class Database
		{
			file = "\server\database";
			class init_extdb3 {};
			class select {};
			class execute {};
		};
	};
	class Serv {
		tag = "SRV";
		class General
		{
			file = "\server\general";
			class log_me {};
			class teleport_me {};
		};
		class Authentification {
			file = "\server\auth";
			class on_ask_account {};
			class on_ask_players {};
			class on_create_player {};
			class on_update_player {};
			class select_account {};
			class select_players {};
			class select_player_by_name {};
			class insert_account {};
			class insert_player {};
			class update_player {};
			class create_player {};
		};
	};
};
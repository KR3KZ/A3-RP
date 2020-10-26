class CfgPatches
{
	class A3RP_Server
	{
		requiredAddons[] = {"A3_Data_F"};
		fileName = "a3rp_server.pbo";
		name = "A3-RP Server";
		author = "3rK";
	};
};

class CfgFunctions {
	class Sql {
		tag = "DB";
		class Database
		{
			file = "\a3rp_server\database";
			class init_extdb3 {};
			class select {};
			class execute {};
		};
	};
	class Serv {
		tag = "SRV";
		class EventHandler
		{
			file = "\a3rp_server\eventhandler";
			class init_eventhandler {};
			class HandleDisconnect {};
		};
		class General
		{
			file = "\a3rp_server\general";
			class log_me {};
			class teleport_me {};
		};
		class Money
		{
			file = "\a3rp_server\general\money";
			class handle_money {};
		};
		class Save
		{
			file = "\a3rp_server\general\save";
			class save_players {};
			class save_world {};
		};
		class Authentification {
			file = "\a3rp_server\auth";
			class on_ask_account {};
			class on_ask_players {};
			class on_create_player {};
			class on_update_player {};
			class select_account {};
			class insert_account {};
			class select_players {};
			class select_player_by_name {};
			class insert_player {};
			class update_player {};
			class create_player {};
		};
	};
};
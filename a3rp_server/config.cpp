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
			class execute {};
			class init_extdb3 {};
			class select {};
		};
	};
	class Serv {
		tag = "SRV";

		/**
		* a3rp_server/
		*/
		class Account {
			file = "\a3rp_server\account";
			class insert_account {};
			class on_ask_account {};
			class select_account {};
		};
		class EventHandler
		{
			file = "\a3rp_server\eventhandler";
			class HandleDisconnect {};
			class init_eventhandler {};
		};
		class Gear
		{
			file = "\a3rp_server\gear";
			class load_gear {};
		};
		class General
		{
			file = "\a3rp_server\general";
			class log_me {};
			class teleport_me {};
		};
		class Building
		{
			file = "\a3rp_server\building";
			class insert_building {};
			class load_buildings {};
			class lock_building {};
			class on_insert_building {};
			class select_buildings {};
			class unlock_building {};
		};
		class Building_key
		{
			file = "\a3rp_server\building\key";
			class insert_building_key {};
			class select_building_key {};
		};
		class Money
		{
			file = "\a3rp_server\money";
			class handle_money {};
		};
		class Player {
			file = "\a3rp_server\player";
			class create_player {};
			class insert_player {};
			class on_ask_players {};
			class on_create_player {};
			class on_update_player {};
			class select_player_by_name {};
			class select_players {};
			class update_player {};
		};
		class Save
		{
			file = "\a3rp_server\save";
			class save_players {};
			class save_vehicles {};
			class save_world {};
		};
		class Vehicle
		{
			file = "\a3rp_server\vehicle";
			class create_vehicle {};
			class init_vehicle {};
			class insert_vehicle {};
			class load_vehicles {};
			class on_insert_vehicle {};
			class on_update_vehicle {};
			class remove_items_from_vehicle {};
			class select_vehicles {};
			class set_vehicle_damage {};
			class update_vehicle {};
		};
		class Vehicle_inventory
		{
			file = "\a3rp_server\vehicle\inventory";
			class insert_vehicle_inventory {};
			class on_update_vehicle_inventory {};
			class select_vehicle_inventory {};
			class set_vehicle_inventory {};
			class update_vehicle_inventory {};
		}
		class Vehicle_key
		{
			file = "\a3rp_server\vehicle\key";
			class insert_vehicle_key {};
			class select_vehicle_key {};
		}
	};
};
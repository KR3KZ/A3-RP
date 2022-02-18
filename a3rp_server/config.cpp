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
		};
		class Database_insert
		{
			file = "\a3rp_server\database\insert";
			class insert {};
			class prepare_insert {};
		};
		class Database_select
		{
			file = "\a3rp_server\database\select";
			class prepare_select {};
			class process_select {};
			class select {};
		};
		class Database_update
		{
			file = "\a3rp_server\database\update";
			class prepare_update {};
			class update {};
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
			class get_closest_door_from_player {};
			class insert_building_owned {};
			class load_buildings_owned {};
			class lock_building {};
			class lock_closest_building_door {};
			class on_ask_buildings_owned_by_player {};
			class on_insert_building_owned {};
			class select_buildings_owned_by_player {};
			class select_buildings_owned {};
			class unlock_building {};
			class unlock_closest_building_door {};
		};
		class Building_admin
		{
			file = "\a3rp_server\building\admin";
			class insert_building_directory {};
			class select_building_directory_by_classname {};
			class set_building_buyable {};
			class update_building_directory_buyable {};
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
			class lock_vehicle {};
			class on_insert_vehicle {};
			class on_update_vehicle {};
			class remove_items_from_vehicle {};
			class select_vehicles {};
			class set_vehicle_damage {};
			class unlock_vehicle {};
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
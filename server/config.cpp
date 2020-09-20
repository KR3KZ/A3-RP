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
			class init_extdb3_protocol_name {};
		};
	};
	class General {
		tag = "SRV";
		class Logger
		{
			file = "\server\general";
			class log_me {}; 
		};
	};
};
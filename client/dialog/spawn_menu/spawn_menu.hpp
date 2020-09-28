class A3RP_spawn_menu
{
	idd = 1000;
	
	class ControlsBackground
	{
		class frame_map : A3RP_frame 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.26875;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.4625;
			h = safeZoneH * 0.55;
			colorText[] = {0.7,0.7,0.9,0.5};
			
		};
		class sub_title : A3RP_text_uppercase 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.26875;
			y = safeZoneY + safeZoneH * 0.18777778;
			w = safeZoneW * 0.4625;
			h = safeZoneH * 0.03666667;
			text = "$STR_spawn_menu_title";
			colorBackground[] = {0.7,0.7,0.9,0.5};
			
		};
		
	};
	class Controls
	{
		class map : A3RP_RscMapControl 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.26875;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.4625;
			h = safeZoneH * 0.55;
			
		};
		
	};
	
};

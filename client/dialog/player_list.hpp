class A3RP_player_list
{
	idd = -1;
	
	class ControlsBackground
	{
		class background : A3RP_background 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.66875;
			y = safeZoneY + safeZoneH * 0.27333334;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.45222223;
			colorBackground[] = {0.2,0.2,0.2,0.6111};
			
		};
		class title : A3RP_text_title 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.02888889;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.03666667;
			text = "Selection du personnage";
			
		};
		class background_copy1 : A3RP_background 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.27333334;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.45222223;
			colorBackground[] = {0.054,0.07,0.078,0.6};
			
		};
		
	};
	class Controls
	{
		class btn_play : A3RP_button_bold_text 
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44375;
			y = safeZoneY + safeZoneH * 0.78666667;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			text = "JOUER";
			
		};
		
	};
	
};

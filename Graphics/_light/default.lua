return Def.ActorFrame{
	
	Def.ActorFrame{ 
		LoadActor("sky.png")..{ OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,1.5;), },
			
		LoadActor("clouds")..{ OnCommand=cmd(x,0;y,0;zoom,8;
		customtexturerect,0,0,2,2;texcoordvelocity,0.04,0;),},
	},
	
	
}
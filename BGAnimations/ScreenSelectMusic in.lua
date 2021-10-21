local bg = Def.ActorFrame{
	Def.ActorFrame{
		Def.Quad {
			InitCommand=cmd(Center;zoomto,SCREEN_WIDTH*500,SCREEN_HEIGHT*500;diffuse,Color("Black");diffusealpha,0;hibernate,2);
		};
		  Def.ActorFrame {
			  LoadActor(THEME:GetPathB("ScreenWithMenuElements","in")) .. {};
		  };
	};
};

return bg
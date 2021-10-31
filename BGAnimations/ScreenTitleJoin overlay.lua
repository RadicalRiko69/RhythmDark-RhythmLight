return Def.ActorFrame {
	LoadActor(THEME:GetPathG("ScreenTitleMenu","logo"))..{
	  OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	},
	LoadActor(THEME:GetPathG("","press"))..{
	  InitCommand=cmd(Center);
	  OnCommand=cmd(zoom,0.45; addy,150;diffuseshift; effectperiod, 2; effectcolor1, 1,1,1,1; effectcolor2, 1,1,1,0);
	};
};

local gc = Var("GameCommand");

return Def.ActorFrame {
	Def.Quad{
		InitCommand=cmd(zoomto,256,26;fadeleft,0.45;faderight,0.45);
		OnCommand=cmd(diffuseshift;effectcolor1,color("#c1ad4a");effectcolor2,color("#cdaa00"));
		GainFocusCommand=cmd(stoptweening;decelerate,0.1;zoomto,256,26;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;accelerate,0.1;zoomto,SCREEN_WIDTH,0;diffusealpha,0);
	};
	LoadActor(THEME:GetPathB("ScreenTitleMenu","change"))..{
	};
	LoadFont("_chiaro 36px") .. {
		Text=THEME:GetString("ScreenTitleMenu",gc:GetText());
		OnCommand=cmd(strokecolor,Color("Black");y,-8);
		GainFocusCommand=cmd(stoptweening;linear,0.1;zoom,1;diffuse,color("1,1,1,1"));
		LoseFocusCommand=cmd(stoptweening;linear,0.1;zoom,0.75;diffuse,color("0.5,0.5,0.5,1"));
	};
};
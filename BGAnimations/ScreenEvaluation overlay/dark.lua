local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/jacket back"))..{
		InitCommand=cmd(zoom,0.205;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-100;diffusealpha,1);
	};
};

if not GAMESTATE:IsCourseMode() then
	local function JacketUpdate(self)
		local song = GAMESTATE:GetCurrentSong();
		local Jacket = self:GetChild("Jacket");
		local height = Jacket:GetHeight();
		
		if song then
			if song:HasJacket() then
				Jacket:visible(true);
				Jacket:Load(song:GetJacketPath());
				Jacket:scaletoclipped(110,110);
			else
				Jacket:visible(true);
				Jacket:Load(song:GetBannerPath());
				Jacket:scaletoclipped(110,110);
			end;
		else
			Jacket:visible(false);
		end;
		
	end;
	t[#t+1] = Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-100;SetUpdateFunction,JacketUpdate);
		Def.Sprite {
			Name="Jacket";
		};	
	};
end;

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/jacket glow"))..{
		InitCommand=cmd(zoom,0.205;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-100);
		OnCommand=cmd(diffuseshift; effectoffset,1; effectperiod, 3; effectcolor1, 0,0,0,0; effectcolor2, 1,1,1,1);
	};
	LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/jacket frame"))..{
		InitCommand=cmd(zoom,0.205;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-100);
	};
};


return t

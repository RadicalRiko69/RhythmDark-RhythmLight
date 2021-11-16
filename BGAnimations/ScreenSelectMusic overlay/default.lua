local t = Def.ActorFrame {};

local DECOR = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  DECOR = "dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  DECOR = "light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(DECOR);
  PlayerJoinedMessageCommand=function(self)
	SCREENMAN:SetNewScreen("ScreenSelectProfile");
end;
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
				Jacket:scaletoclipped(220,220);
			else
				Jacket:visible(true);
				Jacket:Load(song:GetBannerPath());
				Jacket:scaletoclipped(220,100);
			end;
		else
			Jacket:visible(false);
		end;
		
	end;
	t[#t+1] = Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-50;diffusealpha,0;SetUpdateFunction,JacketUpdate);
		OffCommand=function(self)
			self:sleep(1.8);
			self:diffusealpha(1);
		end;
		Def.Sprite {
			Name="Jacket";
		};	
	};
end;

local NAME = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  NAME = "fall into darkness"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  NAME = "go into the light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(NAME);
};

t[#t+1] = Def.Quad {
	OffCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,Color("White");diffusealpha,0;sleep,1.8;diffusealpha,1;linear,2;diffusealpha,0);
};

return t

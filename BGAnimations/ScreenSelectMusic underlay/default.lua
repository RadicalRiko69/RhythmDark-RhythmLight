local t = Def.ActorFrame {};

if not GAMESTATE:IsCourseMode() then
	local function JacketUpdate(self)
		local song = GAMESTATE:GetCurrentSong();
		local Jacket = self:GetChild("Jacket");
		local height = Jacket:GetHeight();
		
		if song then
			if song:HasBackground() then
				Jacket:visible(true);
				Jacket:Load(song:GetBackgroundPath());
				Jacket:scaletoclipped(854,480);
				Jacket:fadeleft(0.25);
				Jacket:faderight(0.25);
			elseif song:HasJacket() then
				Jacket:visible(true);
				Jacket:Load(song:GetJacketPath());
				Jacket:scaletoclipped(1200,1200);
			elseif song:HasBanner() then
				Jacket:visible(true);
				Jacket:Load(song:GetBannerPath());
				Jacket:scaletoclipped(1880,720);
			end;
		else
			Jacket:visible(false);
		end;
		
	end;
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X+50;y,SCREEN_CENTER_Y;diffusealpha,0.75;SetUpdateFunction,JacketUpdate);
		OnCommand=cmd(x,SCREEN_CENTER_X+50;sleep,3;linear,0.25;diffusealpha,0.75;accelerate,3.25;x,SCREEN_CENTER_X-50;diffusealpha,0;queuecommand,"Right");
		RightCommand=cmd(x,SCREEN_CENTER_X-50;sleep,3;linear,0.25;diffusealpha,0.75;accelerate,3.25;x,SCREEN_CENTER_X+50;diffusealpha,0;queuecommand,"On");
		OffCommand=cmd(diffusealpha,0);
		Def.Sprite {
			Name="Jacket";
		};	
	};
end;

--Jacket and Banner overlay
if not GAMESTATE:IsCourseMode() then
	local function JacketUpdate(self)
		local song = GAMESTATE:GetCurrentSong();
		local Jacket = self:GetChild("Jacket");
		local height = Jacket:GetHeight();
		
		if song then
			if song:HasBackground() then
				Jacket:visible(false);
			elseif song:HasJacket() then
				Jacket:visible(true);
				Jacket:Load(song:GetJacketPath());
				Jacket:scaletoclipped(300,300);
			elseif song:HasBanner() then
				Jacket:visible(true);
				Jacket:Load(song:GetBannerPath());
				Jacket:scaletoclipped(488,172);
			end;
		else
			Jacket:visible(false);
		end;
		
	end;
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X+50;y,SCREEN_CENTER_Y;SetUpdateFunction,JacketUpdate);
		OnCommand=cmd(x,SCREEN_CENTER_X+50;sleep,3;linear,0.25;diffusealpha,1;accelerate,3.25;x,SCREEN_CENTER_X-50;diffusealpha,0;queuecommand,"Right");
		RightCommand=cmd(x,SCREEN_CENTER_X-50;sleep,3;linear,0.25;diffusealpha,1;accelerate,3.25;x,SCREEN_CENTER_X+50;diffusealpha,0;queuecommand,"On");
		OffCommand=cmd(diffusealpha,0);
		Def.Sprite {
			Name="Jacket";
		};	
	};
end;--]]

return t

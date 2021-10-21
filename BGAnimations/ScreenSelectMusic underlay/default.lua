local t = Def.ActorFrame {};

if not GAMESTATE:IsCourseMode() then
	local function JacketUpdate(self)
		local song = GAMESTATE:GetCurrentSong();
		local Jacket = self:GetChild("Jacket");
		local height = Jacket:GetHeight();
		
		if song then
			if song:HasJacket() then
				Jacket:visible(true);
				Jacket:Load(song:GetJacketPath());
				Jacket:scaletoclipped(1200,1200);
			else
				Jacket:visible(true);
				Jacket:Load(song:GetBannerPath());
				Jacket:scaletoclipped(1580,720);
			end;
		else
			Jacket:visible(false);
		end;
		
	end;
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X+100;y,SCREEN_CENTER_Y;diffusealpha,0.25;SetUpdateFunction,JacketUpdate);
		OnCommand=cmd(x,SCREEN_CENTER_X+100;sleep,3;linear,0.25;diffusealpha,0.25;accelerate,3.25;x,SCREEN_CENTER_X-100;diffusealpha,0;queuecommand,"On");
		OffCommand=cmd(diffusealpha,0);
		Def.Sprite {
			Name="Jacket";
		};	
	};
end;

return t

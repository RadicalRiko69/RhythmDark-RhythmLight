local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
	Def.Sprite {
		OnCommand=function(self)
			if GAMESTATE:GetCurrentSong() then
			local song = GAMESTATE:GetCurrentSong();
			if song:HasBackground() then
				self:LoadBackground(song:GetBackgroundPath());
				self:scale_or_crop_background();
				self:diffusealpha(0.75);
				self:draworder(-80);
			elseif song:HasJacket() then
				self:LoadBackground(song:GetJacketPath());
				self:Center();
				self:scaletoclipped(1200,1200);
				self:diffusealpha(0.75);
			elseif song:HasBanner() then
				self:LoadBanner(song:GetBannerPath());
				self:Center();
				self:scaletoclipped(1580,720);
				self:diffusealpha(0.75);
			else
				self:visible(false);
			end
		end;
		end
	};
};

return t

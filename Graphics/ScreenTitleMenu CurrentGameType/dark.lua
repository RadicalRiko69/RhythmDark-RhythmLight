local curGameName = GAMESTATE:GetCurrentGame():GetName();

local t = LoadFont("Common Normal") .. {
	BeginCommand=function(self)
		if IsGame("pump") then
			self:settext("Current Game: PIU");
			self:strokecolor(Color("Black"));
		elseif IsGame("dance") then
			self:settext("Current Game: DDR/ITG");
			self:strokecolor(Color("Black"));
		else
			self:settext("Current Game:"..sGame);
			self:strokecolor(Color("Black"));
		end
	end;
};
return t;
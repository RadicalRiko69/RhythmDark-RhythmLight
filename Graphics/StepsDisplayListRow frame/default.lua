local t =	Def.ActorFrame {};
local sString;
local customx = -12 --The x offset of the orbs.

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

t[#t+1] = Def.ActorFrame{
	CurrentSongChangedMessageCommand=function(self)
		if GAMESTATE:GetCurrentSong() then self:visible(true); else self:visible(false); end;
	end;
	LoadActor("_icon")..{
		InitCommand=cmd(zoom,0.55;addy,2;animate,false);
		SetMessageCommand=function(self,param)
				if param.StepsType then
					--short for "short string".
					--TODO: Using localization values for this is absurd, remove it
					sString = THEME:GetString("StepsDisplay StepsType",ToEnumShortString(param.StepsType));
					if sString == "Single" then
						self:setstate(2);
						self:x(customx+3.2);
					if param.Steps:GetChartStyle() == "NO STEPS" then
						self:setstate(7);
						self:x(customx+3.2);
					end
					elseif sString == "Double" then
						if param.Steps:GetChartStyle() == "Parallel" then
							self:setstate(0);
						elseif param.Steps:GetChartStyle() == "NightMare" then
							self:setstate(5);
						else
							self:setstate(6);
						end
						self:x(customx+3.2);
					elseif sString == "Threepanel" or sString == "Beginner" then
						self:setstate(1);
						self:x(customx+3.2);
					elseif sString == "Routine" then
						self:setstate(4);
						self:x(customx+3.2);
					elseif sString == "Couple" then
						self:setstate(5);
						self:x(customx+3.2);	
					else
						self:setstate(7);
						self:x(customx+3.2);
					end;
			end;
		end;
	};
	LoadFont("_@dfghsgothic-w9 25px")..{
		InitCommand=cmd(zoom,0.95;skewx,-0.2;shadowlength,0.8;shadowcolor,color("0,0,0,1");x,-10;y,-1);
		SetMessageCommand=function(self,param)
			local meter = param.Meter;
			if meter == 99 then
				self:settext("??");
			elseif meter == 9999 then
				self:settext("00");
			elseif meter == 100 then
				self:settext("X");
			elseif meter == 200 then
				self:settext("XX");
			elseif meter == 300 then
				self:settext("XXX");
			elseif meter == 1111 then
				self:settext("x1");
			elseif meter == 2222 then
				self:settext("x2");
			elseif meter == 3333 then
				self:settext("x3");
			elseif meter == 4444 then
				self:settext("x4");
			else
				--Format with 2 integers, so 6 -> 06
				self:settextf("%02d",meter);
			end;
		end;
	};

	-- ANOTHER STEP label for alternative or scrapped steps
	LoadActor("another")..{
		InitCommand=cmd(zoom,0.5;x,-8.5;y,20;);
		SetMessageCommand=function(self,param)
			if param.Steps:GetChartStyle() == "ANOTHER" then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
	};

	-- NIGHTMARE label for mod charts
	LoadActor("nm")..{
		InitCommand=cmd(zoom,0.5;x,-8.5;y,20;);
		SetMessageCommand=function(self,param)
			if param.Steps:GetChartStyle() == "NightMare" then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
	};

	-- FREESTYLE label for performance charts
	LoadActor("freestyle")..{
		InitCommand=cmd(zoom,0.5;x,-8.5;y,20;);
		SetMessageCommand=function(self,param)
			if param.Steps:GetChartStyle() == "Freestyle" then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
	};

	-- CO-OP label
	LoadActor("coop")..{
		InitCommand=cmd(zoom,0.5;x,-8.5;y,20;);
		SetMessageCommand=function(self,param)
			sString = THEME:GetString("StepsDisplay StepsType",ToEnumShortString(param.StepsType));
			if sString == "Routine" then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
	};

	-- NO STEPS label for secret credits songs
	LoadActor("no steps")..{
		InitCommand=cmd(zoom,0.5;x,-8.5;y,20;);
		SetMessageCommand=function(self,param)
			sString = THEME:GetString("StepsDisplay StepsType",ToEnumShortString(param.StepsType));
			if param.Steps:GetChartStyle() == "NO STEPS" then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
	};

	-- NEW label for 2018 exclusive charts
	LoadActor("new")..{
		InitCommand=cmd(zoom,0.5;x,-8.5;y,-15;);
		SetMessageCommand=function(self,param)
			if param.Steps:GetDescription() == "NEW" then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
	};

};



return t

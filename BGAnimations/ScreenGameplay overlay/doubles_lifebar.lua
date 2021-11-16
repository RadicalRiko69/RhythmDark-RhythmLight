--LoadActor("file.lua", argument) -> arguments are passed in as "...". As in literally, the variable is named "..." (without the quotes)
local player = ...;
--in normal syntax, style = (GetStyle() == "OnePlayerTwoSides") ? "Single" : "Double")
local style = (ToEnumShortString(GAMESTATE:GetCurrentStyle():GetStyleType()) == "OnePlayerTwoSides") and "Double" or "Single";
--SCREENMAN:SystemMessage(style);

--Size of frame (just the inner part of the lifebar)
local LIFEBAR_WIDTH = SCREEN_WIDTH-130

--Size of the actual lifebar. Yes I know this is terrible code I'll fix it later I swear
local LIFEBAR_REALWIDTH = LIFEBAR_WIDTH+60

return Def.ActorFrame{

	---basemeter masked P1
	LoadActor("basemeter") .. {	
		InitCommand=cmd(valign,0.5;xy,-LIFEBAR_WIDTH/2-30,6;horizalign,left;zoomy,0.5;blend,Blend.Add); 
		OnCommand=cmd(bounce;effectmagnitude,-40,0,0;effectclock,"bgm";effecttiming,1,0,0,0;);
		LifeChangedMessageCommand=function(self,params)
				if params.Player == player then	
					local lifeP1 = params.LifeMeter:GetLife();
					if GAMESTATE:IsHumanPlayer(player)==true then
						if lifeP1==0 then
							self:visible(false);
						else
							
							if lifeP1==1 then
								self:effectmagnitude(0,0,0);
							else
								self:effectmagnitude(-40,0,0);
							end;
					
							self:visible(true);
						end
					end
					self:zoomtowidth((LIFEBAR_REALWIDTH)*lifeP1)
								
				end;
		end;

	};
	LoadActor("tip") .. {	
		InitCommand=cmd(y,6;zoom,0.5);
		LifeChangedMessageCommand=function(self,params)
			if params.Player == player then	
				local style = GAMESTATE:GetCurrentStyle();		
				local lifeP1 = params.LifeMeter:GetLife();
						
				if lifeP1 <= THEME:GetMetric("LifeMeterBar", "DangerThreshold") then
					self:diffusecolor(1,0.7,0.7,0.7);
				else
					self:diffusecolor(1,1,1,1);
				end
				
				if GAMESTATE:IsHumanPlayer(player)==true then
					if lifeP1==0 then
						self:visible(false);
					else
						self:visible(true);
					end
				end
				--Need to offset it by half the lifebar width since otherwise it would be starting at the lifebar's center and going way off
				self:x(LIFEBAR_REALWIDTH*lifeP1-(LIFEBAR_REALWIDTH/2));	

					
			end;
		end;

	};
	
	
	-- Left Corner
	LoadActor("begin") .. {
		InitCommand=cmd(x,-LIFEBAR_WIDTH/2;horizalign,right;zoom,0.75;);
	};
	
	-- Center
	LoadActor("frame") .. {
		OnCommand=cmd(zoomtowidth,LIFEBAR_WIDTH;zoomy,0.75;);
	};

	
	-- Right Corner
	LoadActor("begin") .. {
		InitCommand=cmd(x,LIFEBAR_WIDTH/2;horizalign,right;zoom,0.75;rotationy,180);
	};

};

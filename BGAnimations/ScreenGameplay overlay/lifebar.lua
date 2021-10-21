local player = ...

--Size of frame (just the inner part of the lifebar)
local LIFEBAR_WIDTH = SCREEN_WIDTH/2-130

--Size of the actual lifebar. Yes I know this is terrible code I'll fix it later I swear
local LIFEBAR_REALWIDTH = LIFEBAR_WIDTH+60



return Def.ActorFrame{
	--[[
	Everything should be based around the center
	because it's the best indicator of the lifebar
	width (it's easy to debug)
	]]
	
	InitCommand=function(self)
		--It flips itself for player 2, because I'm a lazy coder
		if player == PLAYER_2 then
			self:zoomx(-1);
		end;
	end;
	
	---basemeter masked P1
	LoadActor("basemeter") .. {	
		InitCommand=cmd(valign,0.5;xy,-LIFEBAR_WIDTH/2-35,6;horizalign,left;zoomy,0.5;blend,Blend.Add); 
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
	
	-- Center
	LoadActor("frame") .. {
		OnCommand=cmd(zoomtowidth,LIFEBAR_WIDTH;zoomy,0.75;);
	};
	
	-- Right Corner
	LoadActor("end") .. {
		--horizalign right isn't a mistake, the graphic is flipped with zoomx
		InitCommand=cmd(x,LIFEBAR_WIDTH/2;horizalign,right;zoomx,-0.75;zoomy,0.75;); 
		
		HealthStateChangedMessageCommand=function(self,params)
			if params.Player == player then
				if params.HealthState == 'HealthState_Dead' then
				self:visible(false);
				end;
			end;
		end;
	};
	
	-- Left Corner
	LoadActor("begin") .. {
		InitCommand=cmd(x,-LIFEBAR_WIDTH/2;horizalign,right;zoom,0.75;);
	};
	
	
	LoadActor("tip") .. {	
		InitCommand=cmd(valign,0.5;y,6;zoom,0.5;blend,Blend.Add;);
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
				self:x(LIFEBAR_REALWIDTH*lifeP1-(LIFEBAR_REALWIDTH/2+5));	

					
			end;
		end;

	};


}

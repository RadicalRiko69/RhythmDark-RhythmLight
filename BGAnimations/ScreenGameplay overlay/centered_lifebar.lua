local player, LIFEBAR_WIDTH = ...

--Size of frame (just the inner part of the lifebar)
--local LIFEBAR_WIDTH = SCREEN_WIDTH/2-200

--Size of the actual lifebar. Yes I know this is terrible code I'll fix it later I swear
local LIFEBAR_REALWIDTH = LIFEBAR_WIDTH+50



return Def.ActorFrame{
	
	---basemeter masked P1
	LoadActor("basemeter") .. {
		InitCommand=cmd(zoomy,.5;zoomtowidth,LIFEBAR_REALWIDTH;y,6;blend,Blend.Add;horizalign,left;x,-LIFEBAR_REALWIDTH/2);
		--InitCommand=cmd(valign,0.5;xy,-LIFEBAR_REALWIDTH/2,6;horizalign,left;zoomy,0.5;blend,Blend.Add); 
		OnCommand=cmd(--[[bounce;effectmagnitude,-40,0,0;effectclock,"bgm";effecttiming,1,0,0,0;]]);
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
	
	-- Left Corner
	LoadActor("end") .. {
		--horizalign right isn't a mistake, the graphic is flipped with zoomx
		InitCommand=cmd(x,-LIFEBAR_WIDTH/2;horizalign,right;zoomx,0.75;zoomy,0.75;); 
		
		HealthStateChangedMessageCommand=function(self,params)
			if params.Player == player then
				if params.HealthState == 'HealthState_Dead' then
				self:visible(false);
				end;
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
	
	--SCORE
	--[[LoadFont("venacti/_venacti_outline 26px bold monospace numbers") .. {
		InitCommand=cmd(zoomy,0.45;uppercase,true;shadowlength,1;x,LIFEBAR_WIDTH/2+20;);
		
		--Flip the score back around and change alignment if player 2
		OnCommand=function(self)
			if player == PLAYER_2 then
				self:horizalign(left);
				self:zoomx(-.45);
			else
				self:horizalign(right);
				self:zoomx(.45);
			end;
		end;
		ComboChangedMessageCommand=function(self)
			local PSS = STATSMAN:GetCurStageStats():GetPlayerStageStats(player);
			self:settext(PSS:GetScore());
		end;
	};]]
	
	LoadActor("tip") .. {	
		InitCommand=cmd(zoom,0.5;y,6;blend,Blend.Add;);
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


}

-- Placed here to keep shit from breaking until I get myself together long enough to deal with it all
function scale_to_fit(actor, width, height)
	local xscale= width / actor:GetWidth()
	local yscale= height / actor:GetHeight()
	actor:zoom(math.min(xscale, yscale))
end

function getJacketOrBanner(song)
	if song:HasBackground() then
		return song:GetBackgroundPath();
	elseif song:HasBanner() then
		return song:GetBannerPath();
	elseif song:HasJacket() then
		return song:GetJacketPath();
	else
		return THEME:GetPathG("Common","fallback banner");
	end;
end;

--This is honestly only ever called in ScreenOptionsCustomizeProfile so it's kind of useless
function getProfileIcons()
    local fullPath = THEME:GetPathG("","Avatars")
    local files = FILEMAN:GetDirListing(fullPath.."/")
    return files;
    --[[local avatars = {}

    for k,filename in ipairs(files) do
        avatars[#avatars+1] = filename
    end
    return avatars;]]
end;

function strArrayToString(a)
	local s = "";
	for i = 1, #a do
		if type(a[i]) == "string" then
			s = s..a[i]..",";
		else
			s = s.."ERROR,";
		end;
	end
	return s;
end

function GetGradeFromDancePoints(dancepoints)
	--SS aka perfect score
   if dancepoints == 100 then
	   return "Tier00";
   --S
   elseif dancepoints >= 99 then
	   return "Tier01";
   --Silver S
   elseif misses==0 then
	   return "Tier02";
   --A
   elseif dancepoints >= 80 then
	   return "Tier03";
   --B
   elseif dancepoints >= 70 then
	   return "Tier04";
   --C
   elseif dancepoints >= 60 then
	   return "Tier05";
   --D
   elseif dancepoints >= 50 then
	   return "Tier06";
   --F
   else
	   return "Tier07";
   end
end;

function X3Wheel(self,offsetFromCenter,itemIndex,numItems)
	local function GetZoom(offsetFromCenter)
		if math.abs(offsetFromCenter) >= 1 then
			return 0.8;
		else
			return (10.0-math.abs(offsetFromCenter)*2)/10;
		end;
	end;
	local function GetDistence(offsetFromCenter)
		if offsetFromCenter >= 1 then
			return offsetFromCenter*90+84;
		elseif offsetFromCenter <= -1 then
			return offsetFromCenter*90-84;
		else
			return 90*offsetFromCenter + 84*offsetFromCenter
		end;
	end;
	local function GetRotationY(offsetFromCenter)
		if offsetFromCenter > 0.9 then
			return 64+(offsetFromCenter-0.9)*9.8;
		elseif offsetFromCenter < -0.9 then
			return -64+(offsetFromCenter+0.9)*9.8;
		else
			return offsetFromCenter*64/0.9;
		end;
	end;
	local function GetRotationZ(offsetFromCenter)
		if offsetFromCenter < 0 then
			return -offsetFromCenter*0.5;
		else
			return 0;
		end;
	end;
	local function GetRotationX(offsetFromCenter)
		if math.abs(offsetFromCenter) < 0.1 then
			return 0;
		else
			return 4;
		end;
	end;
	self:linear(5.8);
	self:x( GetDistence(offsetFromCenter) );
	self:z(1-math.abs(offsetFromCenter));
	self:draworder( math.abs(offsetFromCenter)*10 );
	self:zoom( GetZoom(offsetFromCenter) );
	self:rotationx( 0 );
	self:rotationy( GetRotationY(offsetFromCenter) );
	self:rotationz( 0 );
end;

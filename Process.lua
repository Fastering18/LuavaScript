local process = {};

local environmentsVar = "undefined";
if (script.Parent:FindFirstChild(".env")) then environmentsVar = require(script.Parent[".env"]); end;

process.memoryUsage = function() 
	return gcinfo("count");
end;
process.env = environmentsVar;

process.exit = function(code)
	--[[
	     Don't use this if you dont have experience with exit on JavaScript!
	     process.exit(0) will destroy all current script (not including built-in script) and kick all players.
	]]
	if (typeof(code) ~= "number" and code ~= nil) then
		warn("exit code should be number!");
		return;
	else
		warn("process exited with: SIGTERM");
		local Code = code or "unspecified code";
		for i,v in pairs(game:GetDescendants()) do
			if v:IsA("Script") and v ~= script then
				local sucess, result
				sucess, result = pcall(function()
					v:Destroy();
				end)			
			elseif v:IsA("Player") then
				v:Kick("Process exited with code "..Code);
			end;
		end;
		return nil;
	end;
end;

return process;

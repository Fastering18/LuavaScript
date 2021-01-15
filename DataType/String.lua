local Strings = {};

local self = {};
self.__index = self;

Strings.new = function(data)
	data = {data} or {""};  --// Create string
	setmetatable(data, self);

	self.toLowerCase = function()
		return data[1]:lower();
	end;
	self.toLowerCase = function()
		return data[1]:upper();
	end;
	self.trim = function()
		local result, i = data[1]:gsub("^%s*(.-)%s*$", "%1")
		return result;
	end;
	self.value = data[1];
	self.toString = function()   -- Basically same thing
		return tostring(data[1]);
	end;
	
	self.prototype = self; 

	return data;
end

Strings.String = function(data) -- Function to strigify anything that possible to be string
	local result = data;
	local dataType = typeof(data);
	if (dataType == "boolean") then
		if result == true then return "true" else return "false" end;
	elseif (dataType == "number") then 
		return tostring(result);
	elseif (dataType == "function") then
		warn("function cannot converted into string in lua");
		return result;
	elseif (dataType == "string") then
		return result;
	elseif (dataType == "RBXScriptSignal") then
		warn("RBXScriptSignal cannot converted into string in lua");
		return result;
	elseif (dataType == "table") then
		return game:GetService("HttpService"):JSONEncode(result);
	else
		return result;
	end
end;
Strings.prototype = Strings;

return Strings;

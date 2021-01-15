local module = {};

local self = {};
self.__index = self;

local Strings
if (script.Parent:FindFirstChild("String")) then Strings = require(script.Parent.String); else Strings = require(6244645359); end;

module.new = function(data)
	data = data or {};  --// Create one dimension array
	setmetatable(data, self);
	
	self.toString = function()
		local resultJSON = game:GetService("HttpService"):JSONEncode(data);
		resultJSON = resultJSON:gsub("\\[", ""):gsub("\\]", "");
		return resultJSON;
	end;
	self.length = #data;
	self.push = function(newValue)
		if (newValue == nil or typeof(Strings.String(newValue)) ~= "string") then
			warn("First parameter should be string/number/boolean");
			return nil;
		else
		    table.insert(data, newValue);
			return newValue;
		end;
	end;
	self.pop = function()
		if (#data <= 0) then return nil end;
		local removed = data[#data];
		table.remove(data, #data);
		return removed;
	end;
	self.shift = function()
		if (#data <= 0) then return nil end;
		local removed = data[1];
		table.remove(data, 1);
		return removed;
	end;
	self.unshift = function(Value)
		table.insert(data, 1, Value);
		return #data;
	end;
	self.indexOf = function(valueToFind, indexStart)
		if (valueToFind == nil or typeof(Strings.String(valueToFind)) ~= "string") then return -1 end;
		indexStart = indexStart or 1;
		return table.find(data, valueToFind, indexStart);
	end;
	self.forEach = function(functionCallback)
		if (functionCallback == nil or typeof(functionCallback) ~= "function") then
			wait("First parameter should be function for loop.");
			return nil;
		else
			for i, v in ipairs(data) do functionCallback(v) end;
			return true; -- The loop is done, continue your work
		end;
	end;
	self.prototype = self; 
	
	return data;
end;

module.prototype = module;

return module;

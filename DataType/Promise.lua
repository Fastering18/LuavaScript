--[[
     Promise data type in Lua, made by Fastering18
     Promise is almost same with pcall, but this not yield.
     
============================================================================

     EXAMPLE USAGE:
     
     local JavaScript = require(path to this module); -- You can fill with asset id of main module
     
     local Promise = JavaScript.Promise
     
     local promise = Promise.new(function(resolve, reject)
	    wait(6)
	    if process.env == nil then
		    resolve("true")
	    else
		    reject("wrong")
	    end
     end) 
     
     --Function handler here
     promise.result(
	    function(result)
		    print("Sucess: "..result);
	    end
     ).catch(
	    function(err)
		    print("Error: "..err);
	    end
     ).final()   -- final required to end the input, this function used to start processing the request.
]]


local Promise = {};

local self = {};
self.__index = self;

Promise.new = function(handleFunction)
	if (handleFunction == nil or typeof(handleFunction) ~= "function") then
		warn("First parameter should be function!");
		return;
	else
		local data = {
			handler = handleFunction,
			["then"] = function(result) end,
	
		};  --// Create object
		setmetatable(data, self);

		self.result = function(thenFunction)
			if (typeof(thenFunction) ~= "function") then 
				warn("Promise.result() must include function parameter!");
				return nil;
			else
				data["then"] = thenFunction;
				return data;
			end;

		end;
		self.catch = function(catchFunction)
			if (typeof(catchFunction) ~= "function") then 
				warn("Promise.catch() must include function parameter!");
				return nil;
			else
				data["catch"] = catchFunction;
				return data;
			end
		end;
		self.final = function()
			coroutine.resume(coroutine.create(function()
				if (data.catch == nil or typeof(data.catch) ~= "function") then data["catch"] = function(err) warn("UnhandledPromiseRejection Error: "..err); end; end;
				handleFunction(data["then"], data["catch"]);
			end));
		end;		
		
		self.prototype = self; 

		return data;
	end;
end;

return Promise;

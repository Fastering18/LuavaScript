--[[
     Promise data type in Lua, made by Fastering18
     Promise is almost same with pcall, but this not yield and you can add handler yourself.
     
============================================================================

     EXAMPLE USAGE:
     
     local JavaScript = require(path to LuavaScript module); -- You can fill with asset id of main module
     
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
     ).final()   -- final() is not required in latest update
]]


local Promise = {};

local self = {};
self.__index = self;
self.__type = "Promise"

Promise.new = function(handleFunction): Promise<pending>
	if (handleFunction == nil or typeof(handleFunction) ~= "function") then
		warn("TypeError: First parameter should be function!");
		return;
	else
		local data = {
			handler = handleFunction,
			["then"] = function(result) end,
			timeOut = false,
			called = false
		};  --// Create object
		setmetatable(data, self);
		
		local timeOut = function(waktu)
			if data.timeOut == true then return end
			if data.called == true then return end
			data.called = true
			wait(waktu or .1)
			data.timeOut = true
			if (data.fail == nil or typeof(data.fail) ~= "function") then data.fail = function(err) warn("UnhandledPromiseRejection Error: "..err); end; end;
			handleFunction(data["then"], data["fail"]);
		end
		self.result = function(thenFunction)
			if (typeof(thenFunction) ~= "function") then 
				warn("TypeError: Promise.result() must include function parameter!");
				return nil;
			else
				data["then"] = thenFunction;
				coroutine.wrap(timeOut)(.15)
				return data;
			end;
		end;
		self.catch = function(catchFunction)
			--if (typeof(catchFunction) == "string" and typeof(data.fail) == "function") then return warn(catchFunction) elseif (typeof(catchFunction) == "string" and typeof(data.fail) ~= "function") then warn("UnhandledPromiseRejection Error: "..catchFunction); end
			if (typeof(catchFunction) ~= "function") then 
				warn("TypeError: Promise.catch() must include function parameter!");
				return nil;
			else
				data["fail"] = catchFunction;
				--coroutine.resume(timeOut)
				coroutine.wrap(timeOut)(.15)
				return data;
			end
		end;
		self.final = function()
			data.timeOut = true
			coroutine.resume(coroutine.create(function()
				if (data.fail == nil or typeof(data.fail) ~= "function") then data["fail"] = function(err) warn("UnhandledPromiseRejection Error: "..err); end; end;
				handleFunction(data["then"], data["fail"]);
			end));
		end;		
		
		self.prototype = self; 

		return data;
	end;
end;

return Promise;

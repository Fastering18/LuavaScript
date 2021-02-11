# LuavaScript
JavaScript functions written in lua, Roblox Studio.

## EXAMPLE USAGE
```lua
local JavaScript = require(path to main module); -- You can fill with asset id of main module
     
local Array = JavaScript.Array;
local process = JavaScript.process;
local String = JavaScript.String;
local Promise = JavaScript.Promise;


-- ARRAY

local arr = Array.new({"Two", "Three"});
arr.unshift("One");
arr.push("Four");

print(arr.indexOf("Two"));

arr.forEach(function(element)
	 print("value: "..element);
end);

print(arr.toString());


-- STRING

local str = String.new("   Hello World  ");
print(str.toLowerCase().trim().value);


-- PROCESS & .ENV

process.env.token = "This isn't bot token -_-";
print(process.env);


-- PROMISE 

local promise = Promise.new(function(resolve, reject)
	wait(6)
	if process.env == nil then
		resolve("correct!")
	else
		reject("wrong!!")
	end
end)
promise.result(
	function(result)
		print("Sucess: "..result);
	end
).catch(
	function(err)
		print("error: "..err);
	end
).finally(function() 
    print("promise ended") 
end) 
```

[Toolbox LuavaScript](https://www.roblox.com/library/6244962761/LuavaScript) <br>
Install package directly from ROBLOX toolbox.<br>

## Made by Fastering18, 2021<br>
Please report any bug if you found, feedback appreciated!

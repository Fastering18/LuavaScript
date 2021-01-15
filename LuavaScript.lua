--[[
     LuaU & JavaScript function, written in LuaU with OOP programming.
     Requested resources will automatically imported if its doesnt exist.
     Made by Fastering18, 2021.
     
 =====================================================================================    
 
     USAGE EXAMPLE:
     
     local JavaScript = require(path to this module); -- You can fill with asset id of main module
     
     local Array = JavaScript.Array;
     local process = JavaScript.process;
     local String = JavaScript.String;
     local Promise = JavaScript.Promise;
     
     local arr = Array.new({"Two", "Three"});
     arr.unshift("One");
     arr.push("Four");

     print(arr.indexOf("Two"));

     arr.forEach(function(element)
	    print("value: "..element);
     end);

     print(arr.toString());
]]

local Process, String, Array, Promise;
if (not script:FindFirstChild("DataType")) then local dataTypes = Instance.new("Folder"); dataTypes.Parent = script; end;
if (script:FindFirstChild("Process")) then Process = require(script.Process); else Process = require(6244642730); end;
if (script.DataType:FindFirstChild("String")) then String = require(script.DataType.String); else String = require(6244645359); end;
if (script.DataType:FindFirstChild("Array")) then Array = require(script.DataType.Array); else Array = require(6244647301); end;
if (script.DataType:FindFirstChild("Promise")) then Promise = require(script.DataType.Promise); else Promise = require(6245278266); end;

local module = {};

module.process = Process;
module.String = String;
module.Array = Array;
module.Promise = Promise;

-- Still on working -_-

return module;

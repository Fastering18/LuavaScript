--[[
    Stores global variables for current server.
    You can access variable to different script!

======================================================================    

    USAGE EXAMPLE:
    local JavaScript = require(path to this module); -- You can fill with asset id of main module
    local process = JavaScript.process;
     
    process.env.currentTime = os.time()
    print(process.env) -- Return table
]]

local Variables = {
	
}

return Variables

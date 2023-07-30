colony = peripheral.find("colonyIntegrator")
me = peripheral.find("meBridge")
storage = "front" --Storage for export need to change 
if colony == nil then error("colonyIntegrator not found") end
if me == nil then error("MEBridge not found") end
if not colony.isInColony then error("Block is not in a colony") end
workRequests = colony.getRequests()
print("Colony name:".. colony.getColonyName())



function check()
        print("check")
    if workRequests[1] == nil then print("List is empty")             
            print("sleep")
            sleep(5)
        else
            for h in pairs(workRequests) do
             if string.find(workRequests[h].target, "Builder") then
                working()
                end    
             end
        
    end
end

function working()
    for w in pairs(workRequests) do
      if string.find(workRequests[w].target, "Builder")then
          print(workRequests[w].target)
          print(workRequests[w].desc)
          print(workRequests[w].items[1].name)
          print("")
          name1 = workRequests[w].items[1].name
          count1 = workRequests[w].count
          me.exportItemToPeripheral({name=name1, count=count1, nbt=nil}, storage)
        end    
    end
end
function Main()
    while true do
        check()
        os.sleep(30)
    end
end

parallel.waitForAll(Main)

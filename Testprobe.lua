local colony = peripheral.find("colonyIntegrator")

if colony == nil then error("colonyIntegrator not found") end

if not colony.isInColony then error("Block is not in a colony")
end
   print("Colony name:".. colony.getColonyName())
 
workRequests = colony.getRequests()

if workRequests[1] == nil then print("Liste Leer") 
   sleep(5)
  end 

for w in pairs(workRequests) do
  if string.find(workRequests[w].target, "Builder")then
  print(workRequests[w].target)
  print(workRequests[w].desc)
  print(workRequests[w].items[1].name)
  print(workRequests[w].count)
  print("")
  end
 end

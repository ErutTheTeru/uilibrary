getgenv().save = function(foldername, filename, filecontent)
    print(unpack(filecontent))
    local filename = foldername.."/"..filename..".json"
    local filecontent = game:GetService("HttpService"):JSONEncode(filecontent)
    if isfolder(foldername) then
        writefile(filename, filecontent)
    else
        makefolder(foldername)
        writefile(filename, filecontent)
    end
end

getgenv().readdata = function(foldername, filename, tabs)
    local filename = foldername.."/"..filename..".json"
    if isfolder(foldername) then
        if isfile(filename) then
            return game:GetService("HttpService"):JSONDecode(readfile(filename))
        end
    end
    return tabs
end

getgenv().loadsetting = function(foldername, filename, tabs)
    local UIConfig = readdata(foldername, filename, tabs)
    for Tab, TabFunc in tabs do
        for NameItem, Item in TabFunc do
            if Item.Type == "Dropdown" then
                for _, v in Item.Value do
                    if not Win11Config[Tab][NameItem] or not Win11Config[Tab][NameItem].Value[v] then
                        Item:Set(Win11Config[Tab][NameItem].Value)
                        break
                    end
                end
            else
                if v.Type ~= "Button" and Win11Config[Tab][NameItem] and Win11Config[Tab][NameItem].Value ~= Item.Value then
                    Item:Set(Win11Config[Tab][NameItem].Value)
                end
                if Item["Setting Item"] then
                    for _, v in Item["Setting Item"] do
                        if Win11Config[Tab][NameItem]["Setting Item"] and Win11Config[Tab][NameItem]["Setting Item"] ~= v.Value then
                            v:Set(Win11Config[Tab][NameItem]["Setting Item"].Value)
                        end
                    end
                end
            end
        end
    end
end

getgenv().readdata = function(foldername, filename, tabs)
    local filename = foldername.."/"..filename..".json"
    if isfolder(foldername) then
        if isfile(filename) then
            return game:GetService("HttpService"):JSONDecode(readfile(filename))
        end
    end
    return tabs
end

getgenv().save = function(foldername, filename, filecontent)
    local filename = foldername.."/"..filename..".json"
    local filecontent = game:GetService("HttpService"):JSONEncode(filecontent)
    if isfolder(foldername) then
        writefile(filename, filecontent)
    else
        makefolder(foldername)
        writefile(filename, filecontent)
    end
end

getgenv().loadsetting = function(foldername, filename, tabs)
    local UIConfig = readdata(foldername, filename, tabs)
    for Tab, TabFunc in tabs do
        if UIConfig[Tab] then
            for NameItem, Item in TabFunc do
                if type(Item) == "table" and UIConfig[Tab][NameItem] and Item.Type and UIConfig[Tab][NameItem].Type then
                    if Item.Type == "Dropdown" then
                        Item:Refresh(UIConfig[Tab][NameItem].Options, UIConfig[Tab][NameItem].Value)
                    else
                        print(UIConfig[Tab][NameItem].Value)
                        if Item.Type ~= "Button" and UIConfig[Tab][NameItem] and UIConfig[Tab][NameItem].Value ~= Item.Value then
                            print(UIConfig[Tab][NameItem].Value)
                            Item:Set(UIConfig[Tab][NameItem].Value)
                        end
                        if Item["Setting Item"] then
                            for _, v in Item["Setting Item"] do
                                if UIConfig[Tab][NameItem]["Setting Item"] and UIConfig[Tab][NameItem]["Setting Item"] ~= v.Value then
                                    v:Set(UIConfig[Tab][NameItem]["Setting Item"].Value)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

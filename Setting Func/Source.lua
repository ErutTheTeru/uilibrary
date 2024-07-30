getgenv().readdata = function(foldername, filename, tabs)
    local filename = foldername.."/"..filename..".json"
    if isfolder(foldername) then
        if isfile(filename) then
            return game:GetService("HttpService"):JSONDecode(readfile(filename))
        end
    end
    return false
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
    if UIConfig then
        for NameTab, TabFunc in tabs do
            if UIConfig[NameTab] then
                for NameItem, Item in TabFunc do
                    if type(Item) == "table" and UIConfig[NameTab][NameItem] and Item.Type and UIConfig[NameTab][NameItem].Type then
                        if Item.Type == "Dropdown" then
                            Item:Refresh(UIConfig[NameTab][NameItem].Options, UIConfig[NameTab][NameItem].Value)
                        else
                            if Item.Type ~= "Button" and UIConfig[NameTab][NameItem] and UIConfig[NameTab][NameItem].Value ~= Item.Value then
                                Item:Set(UIConfig[TNameab][NameItem].Value)
                            end
                        end
                        if Item["Setting Item"] then
                            for i, v in Item["Setting Item"] do
                                if UIConfig[NameTab][NameItem]["Setting Item"][i] and UIConfig[NameTab][NameItem]["Setting Item"][i] ~= v.Value then
                                    v:Set(UIConfig[NameTab][NameItem]["Setting Item"][i].Value)
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        save(foldername, filename, tabs)
    end
end

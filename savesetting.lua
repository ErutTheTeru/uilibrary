function getgenv().save(foldername, filename, filecontent)
    local filecontent = HttpService:JSONEncode(filecontent)
    if isfolder(foldername) then
        writefile(filename, filecontent)
    else
        writefile(filename, filecontent)
        makefolder(foldername)
    end
end

function getgenv().readdata(foldername, filename, tabs)
    if isfolder(foldername) then
        if isfile(filename) then
            return game:GetService("HttpService"):JSONDecode(readfile(filename))
        end
    end
    return tabs
end

function getgenv().loadsetting(foldername, filename, tabs)
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
                if Win11Config[Tab][NameItem] and Win11Config[Tab][NameItem].Value ~= Item.Value then
                    Item:Set(Win11Config[Tab][NameItem].Value)
                end
            end
        end
    end
end

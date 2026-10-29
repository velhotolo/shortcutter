local lwtk = require("lwtk")
local db = require("database")
--local db = require("database")

--local apps = db.fetch_all()

local Column, Row = lwtk.Column, lwtk.Row
local layout = lwtk.Column
local upperPage = lwtk.Column
local menu = lwtk.Column
local PushButton = lwtk.PushButton
local TextLabel = lwtk.TextLabel
local Space = lwtk.Space

local software = lwtk.TextInput { text = "" }
local action = lwtk.TextInput { text = "" }
local shortcut = lwtk.TextInput { text = "" }

local app = lwtk.Application("Shortcutter")
app:addStyle(require("theme"))
local win = lwtk.Window

local function addShortcuts()
    local newApp, err = db.create({ name = software.text, commands = shortcut.text, action = action.text })
    if newApp then
        print("App created successfully")
    else
        print("Error..." .. err)
    end
end

upperPage = Column {
    Row {
        TextLabel { text = "Software:" },
        TextLabel { text = "Action:" },
        TextLabel { text = "Shortcut:" }
    }, Row {
    software,
    action,
    shortcut,
    PushButton {
        text = "Save",
        onClicked = function()
            addShortcuts()
        end
    }
}
}

local function groupButtons2()
    menu = Row { PushButton {
        text = "",
        onClicked = function()
        end },
    }
    return menu
end

local softwares = Column {}

for i = 1, 5 do
    softwares:addChild(groupButtons2())
end

local function writeShortcut()
    local finalText = Row {
        TextLabel { text = "Software:" },
        TextLabel { text = software.text or "" },
        TextLabel { text = "Shortcut:" },
        TextLabel { text = shortcut.text or "" },
        TextLabel { text = "Action:" },
        TextLabel { text = action.text or "" },
        Space {},
    }
    return finalText
end

local app1 = Column {}

for i = 1, 5 do
    app1:addChild(writeShortcut())
end

local function groupButtons()
    menu = Row { PushButton {
        text = "Edit",
        onClicked = function()
        end },
        PushButton {
            text = "Remove",
            onClicked = function()
            end },
    }
    return menu
end

local app2 = Column {}

for i = 1, 5 do
    app2:addChild(groupButtons())
end

layout = Column {
    upperPage, Row { softwares,
    app1, app2
}
}

win = app:newWindow {
    title = "Shortcutter",
    layout
}

win:show()
app:runEventLoop()

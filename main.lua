local lwtk = require("lwtk")
local A = require("database")

-- Upvalues
local Column, Row = lwtk.Column, lwtk.Row
local layout = lwtk.Column
local upperPage = lwtk.Column
local menu = lwtk.Column
local PushButton = lwtk.PushButton
local TextLabel = lwtk.TextLabel

-- Inputs
local software = lwtk.TextInput { text = "" }
local action = lwtk.TextInput { text = "" }
local shortcut = lwtk.TextInput { text = "" }

-- Application
local app = lwtk.Application("Shortcutter")
app:addStyle(require("theme"))
local win = lwtk.Window

local function groupButtonsSoftwares(id)
    menu = Row { PushButton {
        text = nil,
        onClicked = function()
        end },
    }
    return menu
end

local softwares = Column {}

for i = 1, 15 do
    local id = tostring(i)
    local ButtonsSoftwares = {}
    table.insert(ButtonsSoftwares, id)
    softwares:addChild(groupButtonsSoftwares(id))
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
        end
    }
}
}

local function writeShortcut()
    local finalText = Row {
        TextLabel { text = "Shortcut" },
        TextLabel { text = "Action" },

    }
    return finalText
end

local app1 = Column {
    writeShortcut()
}

local app2 = Column {}

local function textWritten(id)
    local bosana = Row {
        TextLabel { text = shortcut.text },
        TextLabel { text = action.text } }
    return bosana
end

for i = 1, 15 do
    local id = i
    app2:addChild(textWritten(id))
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

local app3 = Column {}

for i = 1, 15 do
    app3:addChild(groupButtons())
end

layout = Column {
    upperPage, Row { softwares,
    app1, app2, app3
}
}

win = app:newWindow {
    title = "Shortcutter",
    layout
}

win:show()
app:runEventLoop()

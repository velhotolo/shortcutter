local sqlite3 = require("lsqlite3")
local db = sqlite3.open("commands.db")

db:exec([[
CREATE TABLE IF NOT EXISTS apps (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    commands TEXT NOT NULL
);]])

local A = {}

function A.get_all()
    local apps = {}
    local stmt = db:prepare("SELECT id, name, commands FROM apps")

    if not stmt then
        return apps
    end

    while stmt:step() == sqlite3.ROW do
        local row = stmt:get_named_values()
        table.insert(apps, row)
    end
    stmt:finalize()
    return apps
end

function A.create(name, commands, actions)
    local stmt = db:prepare("INSERT INTO apps (name, commands, actions) VALUES (?, ?, ?)")
    if not stmt then
        return nil
    end

    stmt:bind_values(name, commands, actions)

    local res = stmt:step()
    stmt:finalize()

    if res == sqlite3.DONE then
        return db:last_insert_rowid()
    end
    return nil
end

function A.update(id, name, commands)
    local stmt = db:prepare("UPDATE items SET name = ?, commands = ? WHERE id = ?")

    stmt:bind_values(name, commands, id)
    local res = stmt:step()
    stmt:finalize()

    return res == sqlite3.DONE and db:changes() > 0
end

function A.delete(id)
    local stmt = db:prepare("DELETE FROM apps WHERE id = ?")

    stmt:bind_values(id)
    local res = stmt:step()
    stmt:finalize()

    return res == sqlite3.DONE and db:changes() > 0
end

return database

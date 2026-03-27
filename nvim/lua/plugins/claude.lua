local sessions = {}     -- { name = buf }
local active_win = nil
local counter = 0

local function open_win(buf)
    local columns = vim.o.columns
    local lines = vim.o.lines
    local width = math.floor(columns * 0.45)
    local height = math.floor(lines * 0.85)
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        col = columns - width - 2,
        row = math.floor((lines - height) / 2),
        style = "minimal",
        border = "rounded",
        title = " Claude ",
        title_pos = "center",
    })
    vim.wo[win].winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder"
    return win
end

local function hide_active()
    if active_win and vim.api.nvim_win_is_valid(active_win) then
        vim.api.nvim_win_hide(active_win)
        active_win = nil
    end
end

local function start_session(name, cmd)
    local buf = vim.api.nvim_create_buf(false, false)
    vim.bo[buf].bufhidden = "hide"
    hide_active()
    active_win = open_win(buf)
    sessions[name] = buf
    vim.fn.termopen(cmd, {
        on_exit = function()
            if vim.api.nvim_buf_is_valid(buf) then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
            sessions[name] = nil
        end,
    })
    vim.cmd("startinsert")
end

local function resume_session(name)
    local buf = sessions[name]
    hide_active()
    active_win = open_win(buf)
    vim.api.nvim_win_call(active_win, function()
        vim.cmd("normal! G")
    end)
    vim.cmd("startinsert")
end

local function toggle()
    if active_win and vim.api.nvim_win_is_valid(active_win) then
        vim.api.nvim_win_hide(active_win)
        active_win = nil
        return
    end

    -- Prune dead sessions
    for name, buf in pairs(sessions) do
        if not vim.api.nvim_buf_is_valid(buf) then
            sessions[name] = nil
        end
    end

    local items = {}
    for name in pairs(sessions) do
        table.insert(items, name)
    end
    table.sort(items)
    table.insert(items, "  New session")
    table.insert(items, "  Continue last")

    vim.ui.select(items, { prompt = "Claude " }, function(choice)
        if not choice then return end
        if choice == "  New session" then
            counter = counter + 1
            start_session("session #" .. counter, "claude")
        elseif choice == "  Continue last" then
            start_session("last", "claude --continue")
        else
            resume_session(choice)
        end
    end)
end

return {
    {
        dir = vim.fn.stdpath("config"),
        name = "claude-session",
        lazy = false,
        config = function()
            vim.api.nvim_create_user_command("ClaudeToggle", toggle, {
                desc = "Toggle persistent Claude session",
            })
            vim.keymap.set({ "n", "t" }, "<leader>ac", toggle, {
                desc = "Toggle Claude session",
            })
        end,
    },
}

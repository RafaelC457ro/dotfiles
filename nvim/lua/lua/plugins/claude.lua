local state = { buf = nil, win = nil }

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
    vim.wo[win].winblend = 5
    return win
end

local function toggle()
    -- Window open → hide it (session stays alive)
    if state.win and vim.api.nvim_win_is_valid(state.win) then
        vim.api.nvim_win_hide(state.win)
        state.win = nil
        return
    end

    -- Buffer exists and healthy → reopen window
    if state.buf and vim.api.nvim_buf_is_valid(state.buf) then
        state.win = open_win(state.buf)
        vim.cmd("startinsert")
        return
    end

    -- Fresh start: new terminal buffer
    state.buf = vim.api.nvim_create_buf(false, false)
    vim.bo[state.buf].bufhidden = "hide" -- don't wipe on window close
    state.win = open_win(state.buf)

    vim.fn.termopen("claude", {
        on_exit = function()
            if state.buf and vim.api.nvim_buf_is_valid(state.buf) then
                vim.api.nvim_buf_delete(state.buf, { force = true })
            end
            state.buf = nil
            state.win = nil
        end,
    })
    vim.cmd("startinsert")
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

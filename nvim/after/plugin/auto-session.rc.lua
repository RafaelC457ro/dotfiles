local status, session = pcall(require, "auto-session")
if (not status) then return end

session.setup {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
}

local dap = require("dap")

-- Use Mason’s debugpy Python if present, otherwise fall back to python3
local mason_py = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
local adapter_cmd = (vim.fn.executable(mason_py) == 1) and mason_py or vim.fn.exepath("python3")

dap.adapters.python = {
  type = "executable",
  command = adapter_cmd,
  args = { "-m", "debugpy.adapter" },
}

-- Resolve the interpreter that should run YOUR code
local function python_path()
  -- 1) active venv
  local venv = vim.env.VIRTUAL_ENV
  if venv and venv ~= "" then
    return venv .. (vim.loop.os_uname().sysname == "Windows_NT" and "\\Scripts\\python.exe" or "/bin/python")
  end
  -- 2) project-local .venv or venv
  local cwd = vim.fn.getcwd()
  if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then return cwd .. "/.venv/bin/python" end
  if vim.fn.executable(cwd .. "/venv/bin/python") == 1  then return cwd .. "/venv/bin/python" end
  -- 3) fallback
  return vim.fn.exepath("python3") or "python3"
end

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch current file",
    program = "${file}",
    pythonPath = python_path,
    console = "integratedTerminal",  -- use nvim’s terminal
    justMyCode = false,
  },
  {
    type = "python",
    request = "launch",
    name = "Launch module (relativeFileNoExt)",
    module = "${relativeFileNoExt}",
    pythonPath = python_path,
    console = "integratedTerminal",
    justMyCode = false,
  },
}

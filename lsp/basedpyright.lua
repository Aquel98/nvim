--TODO: Read up on the nvim-lspconfig library's version
return {
   cmd = {
      "basedpyright-langserver",
      "--stdio",
   },
   root_markers = {
      "pyrightconfig.json",
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
      ".git",
   },
   filetypes = {
      "python",
   },
   settings = {
      basedpyright = {
         disableOrganizeImports = true,
         analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "openFilesOnly",
            inlayHints = {
               callArgumentNames = true,
            },
         },
      },
      python = {
         analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { "*" },
         },
      },
   },
}

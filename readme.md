# nvim config files

Based off the (fantastic) series `advent of neovim` from TJ: https://youtube.com/playlist?list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&si=k6I2IgElAStLGVgJ

Tested on Windows only.

Requirements:

- gh (https://cli.github.com)
- gh notify (https://github.com/meiji163/gh-notify)
- luals (https://luals.github.io/#neovim-install)
- cmake (for telescope-fzf-native.nvim: https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)
- rg (riggrep: https://github.com/BurntSushi/ripgrep)
- node (https://nodejs.org)
- git (https://git-scm.com/)
- llvm (for clang: https://github.com/llvm/llvm-project - `choco install llvm`)
- html lsp (`npm i -g vscode-langservers-extracted`)

Few additions compared to TJ videos:

- Addition of which-key.nvim with helix preset.
- Addition of snacks.nvim with dashboard and lazygit modules.
- Slightly different keymaps

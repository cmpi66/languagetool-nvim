This is a simple plugin utilizing LanguageTool premium subscription with neovim written in lua.


Map it to a key:

```lua

vim.api.nvim_set_keymap("n", "<Leader>g", ":lua require('languagetool').check_grammar()<CR>", {noremap =

```

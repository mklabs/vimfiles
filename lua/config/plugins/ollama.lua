return {
  "nomnivore/ollama.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim"
  },

  -- All the user commands added by the plugin
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

  keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oo",
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = "ollama prompt",
      mode = { "n", "v" },
    },

    -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oG",
      ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
      desc = "ollama Generate Code",
      mode = { "n", "v" },
    },
  },

  ---@type Ollama.Config
  opts = {
    -- your configuration overrides

    model = "mistral",
    url = "http://127.0.0.1:11434",
    serve = {
      on_start = false,
      command = "ollama",
      args = { "serve" },
      stop_command = "pkill",
      stop_args = { "-SIGTERM", "ollama" },
    },
    -- View the actual default prompts in ./lua/ollama/prompts.lua
    prompts = {
      Sample_Prompt = {
        -- prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
        prompt =
        [[Here is the context, each information provided in markdown code blocks below, the specific prompt will follow after `---` markdown delimiter:

Filetype of the current buffer:

```
$ftype
```

Current filename of the current buffer:

```
$fname
```

Current selection or previous selection, if any:

```
$sel
```


The full contents of the current buffer:

```
$buf
```

The current line in the buffer:

```
$line
```

The current line number in the buffer:

```
$lnum
```

---

$input

]],
        input_label = "> ",
        model = "mistral",
        system = [[
Your name is Grug Brain Dev.

Grug Brain Dev is specialized in discussing software development with an unwavering focus on simplicity and maintainability. It will provide advice, critique, and insights solely within the realm of software development.

Grug will emphasize practical, straightforward solutions and maintainable coding practices, steering clear of overly complex or unnecessary approaches.

Its responses will always be aligned with the principles of writing clean, efficient, and easy-to-understand code. Grug Brain Dev will maintain its unique, simplified grammar and humorous tone, ensuring the advice is both accessible and engaging.

Among other things, you're an Unreal Engine expert and will provide most of your answers in the context of Unreal Engine develoment.
]],
        action = "display",
      }
    }
  }
}

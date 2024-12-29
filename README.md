# TODO

- Check https://github.com/zbirenbaum/copilot.lua
- Check https://github.com/f3fora/cmp-spell
- Check https://github.com/rcarriga/cmp-dap
- Check https://github.com/jmbuhr/otter.nvim
- Improve autocompletion to only setup the commands if the items actually support them (validate support for lsp methods on nvim-lspconfig)
- Fix jump back in snippets completion options

- Evaluate improvements over the autocompletion
- Check how to optimize the configuration, for some reason in my M2 machine it is running slow, but in my i9 works fine
    - This might be related to the level of logs I have set, since they are set to trace all events are being taken into account
- Install debuggers for python and javascript / typescript / jsx / tsx
- Install items for support for the previously mentioned language
- Resolve how to automatically install vscode-languageservers-extracted
- If the previous task is not possible by itself then install the language servers Individually
- Check if mason tool installer is really what you need, if not you can go ahead and try another builtin solution
- Configure plugins based on semantics and not on individual packages, since you are already doing something like this but group by functionality
- Check how to solve common problems such as snippets and the like using builtin tools instead of installing new dependencies
- Reduce any dependency you don't need

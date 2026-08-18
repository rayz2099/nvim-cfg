# Follow Official Surface, keep Operational API

Upgrade will track the AstroNvim v6 template plugin set, but user-facing motions must not change. Presence, lsp_signature, and example LuaSnip/autopairs rules go away. The Cat Logo dashboard header stays. Leap on `f`, buffer `H`/`L`, LSP `gl`/`gd`/`gi`, and the format-on-save allowlist stay.

**Status**: accepted

**Considered Options**
- Keep every current user plugin and example spec
- Reset the whole user layer to the stock template
- Official Surface for plugins/UI, Operational API kept as a thin overlay

A full template reset would break daily motions. Keeping every example plugin would fight the "go official" request. Sign width will be `yes:2`. Mason/treesitter/polish stubs stay disabled.

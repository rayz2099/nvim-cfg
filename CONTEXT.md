# nvim-cfg

Personal AstroNvim user configuration. This glossary names the upgrade and UI marks we treat as first-class, not generic Neovim concepts.

## Language

**Upgrade**:
Moving Neovim, AstroNvim major, and the plugin lock snapshot to the newest current releases together.
_Avoid_: Patch-only refresh, v5 lock bump, partial plugin update

**Official Surface**:
The AstroNvim v6 template plugin inventory and unused example plugins. The dashboard header is not part of this surface.
_Avoid_: 官方, stock template, vanilla

**Cat Logo**:
The custom snacks dashboard header that depicts a cat face.
_Avoid_: ASTRONVIM banner, official header, dashboard example

**Operational API**:
The user's existing keymaps and motion habits that must survive Upgrade, including buffer `H`/`L`, leap on `f`, LSP `gl`/`gd`/`gi`, and the format-on-save filetype allowlist.
_Avoid_: 操作习惯, 操作 API, public mapping, muscle memory

**Badge**:
A count or icon overlaid on tabline or status UI, such as a buffer close mark or file-modified icon.
_Avoid_: 角标, indicator, chip

**Sign**:
A mark drawn in the statuscolumn or signcolumn, such as a git hunk or diagnostic symbol.
_Avoid_: 角标, gutter icon, signcolumn decoration

**Health Noise**:
An optional-tool or provider warning from checkhealth that does not block Upgrade.
_Avoid_: Error, failure, warning

**Config Error**:
A startup, API, or plugin-setup failure in this user config that Upgrade must fix.
_Avoid_: Health Noise, deprecation notice

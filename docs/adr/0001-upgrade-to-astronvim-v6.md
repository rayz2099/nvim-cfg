# Upgrade to Neovim 0.12 and AstroNvim v6

The previous pin was AstroNvim `^5` on Neovim 0.11.1. We will move both to current latest, Neovim 0.12.4 and AstroNvim v6.0.7, because staying on v5 would leave a second breaking migration later.

**Status**: accepted

**Considered Options**
- Stay on AstroNvim v5 and only refresh `lazy-lock.json`
- Upgrade plugins and AstroNvim, leave Neovim at 0.11.1
- Upgrade Neovim, AstroNvim, and the lock snapshot together

We discarded the dirty v5 lock increment and will start from the committed v5.3.15 lock, then pin `version = "^6"`. Optional Health Noise such as lazygit or luarocks is out of scope.

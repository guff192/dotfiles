# Moving plan: Ubuntu → Omarchy (Arch)

This checklist covers what to install on the new Omarchy machine before copying the dotfiles over. It also includes **macOS** notes so the plan stays useful if you switch back later.

---

## 1. Base system

Install a minimal working system first.

```bash
# Update system
sudo pacman -Syu

# Install AUR helper (pick one)
yay -S yay-bin          # or: paru
```

## 2. Shell & terminal core

- [ ] `zsh` — shell
- [ ] `oh-my-zsh` — framework (`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`)
- [ ] `git` — version control
- [ ] `tmux` — terminal multiplexer
- [ ] `fzf` — fuzzy finder
- [ ] `bat` — syntax-highlighting cat (Arch package is `bat`; Ubuntu uses `batcat`)
- [ ] `ripgrep` — fast grep (`rg`)
- [ ] `jq` — JSON processor
- [ ] `translate-shell` — for the `trru` alias (`trans`)
- [ ] `eza` or `lsd` — optional modern `ls` replacements

### macOS equivalent

```bash
brew install zsh tmux fzf bat ripgrep jq translate-shell
```

## 3. Dotfiles

Clone and copy/symlink the repo:

```bash
git clone <this-repo-url> ~/Projects/dotfiles
cd ~/Projects/dotfiles
# Symlink or copy files into ~
stow . -t ~
```

After copying, open a new zsh session.

> **Note:** Set the real `OPENWEATHERMAP_API_KEY` in `~/.zsh_profile` on the new machine. The repo copy has a placeholder only.

## 4. Terminal emulator

- [ ] `alacritty` — config already in `./.config/alacritty/`

### macOS equivalent

```bash
brew install --cask alacritty
```

## 5. Editor

- [ ] Build **neovim** from source (matches the commented PATH in `.zshrc`)
  - Build deps: `sudo pacman -S base-devel cmake ninja unzip curl git gettext`
  - Clone `https://github.com/neovim/neovim` and build with `make CMAKE_BUILD_TYPE=Release`
  - Or install `neovim` from `pacman` if you want to drop the manual build

- [ ] Install **lazy.nvim** dependencies:
  ```bash
  sudo pacman -S fd git make unzip gcc ripgrep wget
  ```

### macOS equivalent

```bash
brew install neovim fd ripgrep git wget
```

## 6. Development stack

### Python

- [ ] `uv` — install from https://github.com/astral-sh/uv (curl | sh)
- [ ] `python` — usually `python` on Arch, `python3` on macOS

### Node.js

- [ ] `fnm` — install from AUR
  ```bash
  yay -S fnm-bin
  ```
- [ ] Install a Node version:
  ```bash
  fnm install --lts
  fnm use --lts
  ```

### JavaScript runtimes

- [ ] `bun` — install from AUR
  ```bash
  yay -S bun-bin
  ```
- [ ] Generate bun completions if the `_bun` file is missing:
  ```bash
  bun completions
  ```

### Go

- [ ] `go`
  ```bash
  sudo pacman -S go
  ```

### macOS equivalents

```bash
brew install uv fnm go
fnm install --lts
brew install oven-sh/bun/bun
```

## 7. Desktop / compositor

- [ ] **Hyprland** — chosen Wayland tiling compositor
  ```bash
  sudo pacman -S hyprland waybar wofi mako polkit-kde-agent
  ```
- [ ] Optional extras: `swww` or `hyprpaper` for wallpaper, `rofi-wayland` for launcher

> **Note:** The current dotfiles do **not** include Hyprland/Sway/KDE configs. You will need to create a new desktop config from scratch.

## 8. Audio stack

Use **PipeWire** with JACK compatibility so REAPER still works.

- [ ] Core audio:
  ```bash
  sudo pacman -S pipewire pipewire-pulse pipewire-jack wireplumber
  ```
- [ ] JACK tools & plugins:
  ```bash
  sudo pacman -S qjackctl qpwgraph carla easyeffects lsp-plugins
  ```
- [ ] REAPER — install from AUR or download from https://www.reaper.fm/
  ```bash
  yay -S reaper
  ```
- [ ] `qbittorrent`
- [ ] `mpv`
- [ ] `rncbc.org` tools: `qjackctl`, `qpwgraph`, `qsynth` (already covered above)
- [ ] VST plugins: MT-PowerDrumKit, DecentSampler (install manually, copy sample libraries via USB)

### macOS equivalents

```bash
brew install --cask reaper
brew install qbittorrent mpv
# Audio: macOS uses CoreAudio; JACK/PipeWire are not standard there.
```

## 9. System monitoring & misc

- [ ] `htop` — config in `./.config/htop/`
- [ ] `ranger` — terminal file manager (config exists, currently empty)
- [ ] `ngrok` — install from AUR or https://ngrok.com/download
- [ ] `kimi-code` CLI — install from https://kimi-code.moonshot.cn (or wherever you got it)
- [ ] `LM Studio` — download from https://lmstudio.ai; `lms` CLI is bundled

### macOS equivalents

```bash
brew install htop ranger
brew install --cask ngrok lm-studio
# kimi-code CLI is not in Homebrew; install manually.
```

## 10. Post-install checks

- [ ] Open a new terminal and confirm zsh loads without errors
- [ ] Check `nvim` opens and plugins install
- [ ] Check `tmux` autostart works
- [ ] Check `fzf` completions load (`[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh`)
- [ ] Check `weather` and `trru` aliases work
- [ ] Set `OPENWEATHERMAP_API_KEY` in `~/.zsh_profile`
- [ ] Confirm `~/.local/bin` is in PATH and `tmux-sessionizer` is executable
- [ ] Run REAPER and set its audio driver to JACK (which talks to PipeWire)

## 11. Skipped (not needed on new machine)

These were in the old `~/.config` but are not being migrated:

- i3 / i3status / picom / rofi / nitrogen
- GNOME/dconf settings
- Browser profiles
- Discord, Proton Mail, VirtualBox, etc.
- Arduino CLI (config not migrated)
- Google Cloud SDK, Yandex Cloud, YDB CLI (removed from `.zshrc`)

---

## Quick one-liner install (Arch/Omarchy)

```bash
sudo pacman -Syu
sudo pacman -S zsh git tmux fzf bat ripgrep jq translate-shell \
               alacritty htop ranger qbittorrent mpv go \
               pipewire pipewire-pulse pipewire-jack wireplumber \
               qjackctl qpwgraph carla easyeffects lsp-plugins \
               hyprland waybar wofi mako polkit-kde-agent
yay -S yay-bin fnm-bin bun-bin reaper ngrok
```

Then install `oh-my-zsh`, `uv`, `fnm`, `neovim` from source, and copy the dotfiles.

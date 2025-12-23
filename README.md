# 🚀 Automatic Oh-My-Zsh Installation Tool

This repository provides an **unattended installation and configuration tool** for setting up a modern Zsh environment with **Oh My Zsh**, the **Powerlevel10k theme**, and a curated set of plugins.  
It is designed to save time and ensure a consistent developer experience across machines and servers.

---

## ✨ Features

- Installs **Zsh** and sets it as the default shell for the current user.
- Installs **Oh My Zsh** automatically.
- Applies a **preconfigured Powerlevel10k theme** with:
  - Rainbow style prompt
  - Unicode character set
  - 24-hour time display
  - Angled separators, sharp heads/tails
  - Compact spacing, concise flow
  - Many icons enabled
  - Transient prompt disabled
  - Instant prompt in verbose mode
- Installs and enables recommended plugins:
  - `git`
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
  - `zsh-history-substring-search`
- Loads a **template configuration file** (`.p10k.zsh`) with all values pre-applied avoiding to waste time on the wizard.

---

## 📦 Requirements

- Ubuntu/Debian-based system (tested on Ubuntu 24.04.3 LTS).
- `sudo` privileges for package installation and shell change.
- Internet connection (to fetch Oh My Zsh, Powerlevel10k, and plugins).

---

## ⚙️ Installation

Clone the repository and run the script:

```bash
git clone https://github.com/yourusername/unattended-zsh-setup.git
cd unattended-zsh-setup
chmod +x install.sh
./install.sh
```

The script will:  
1. Install Zsh and dependencies.  
2. Set Zsh as the default shell for the current user.  
3. Install Oh My Zsh.  
4. Clone Powerlevel10k into the proper theme directory.  
5. Copy the provided `.p10k.zsh` template into your home directory.  
6. Install and activate plugins.  

---

## 🔧 Configuration

- The **Powerlevel10k configuration** is stored in `~/.p10k.zsh`.  
- The script appends a line to `~/.zshrc` to source this file automatically:  
  ```bash
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  ```
- To adjust prompt elements (e.g., show `user@hostname`), edit `~/.p10k.zsh` and reload:  
  ```bash
  source ~/.zshrc
  ```
- If you want to reconfigure Powerlevel10k theme from scratch you can manually run the wizard:
  ```bash
  p10k configure
  ```
---

## 🖼 Example Prompt

After installation, your prompt will look like this:

```
👤 user@hostname ➜ ~/project ⎇ main ✚
```

- `👤` → user@hostname
- `➜` → directory separator
- `⎇ main` → current Git branch
- `✚` → changes staged/unstaged

With rainbow colors, icons, and 24-hour time on the right side.

---

## 📚 Notes

- Run the script as your normal user; it will ask for `sudo` only when required.  

---

## 🤝 Contributing

Feel free to fork, open issues, or submit pull requests to improve the script and configuration.

---

## 📜 License

MIT License – free to use, modify, and distribute.

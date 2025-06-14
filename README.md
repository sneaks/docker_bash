# 🐳 docker_bash

> A portable, Jojo && Aavi powered bash shell setup for all your Docker containers.  
Includes colorful prompts, helpful aliases, and a welcoming MOTD that says,  
“You didn’t just open a shell—you entered the dojo.”

---

## 📦 What it includes

- `.bashrc` – Clean prompt, autocompletion, loads `.aliases` and `.motd.sh`
- `.aliases` – Helpful commands like `ll`, `orun`, and `gs`
- `.bash_profile` – Login shell passthrough to `.bashrc`
- `motd.sh` – Colorful, info-rich welcome message with uptime, memory, disk, and Ollama model count
- `docker-init.sh` – Inject or copy this profile into any container or project

---

## ⚡ Usage

### 🐚 Inject profile into a running container:

```bash
make inject NAME=ollama
make inject NAME=open-webui
make all NAME=ollama open-webui aavios smearts # inject into multiple dcs

This project is maintained by [@sneaks](https://github.com/sneaks)

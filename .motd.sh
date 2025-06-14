#!/bin/bash

echo ""
echo -e "\e[1;32m👋 Hey Jojo, welcome to your container shell!\e[0m"
echo "--------------------------------------------"
echo -e "📦 Container:  \e[1m$(hostname)\e[0m"
echo -e "🕒 Uptime:     $(uptime -p)"
echo -e "🌐 IP:         $(hostname -I | cut -d' ' -f1)"
echo -e "💾 Disk Used:  $(df -h / | tail -1 | awk '{print $3 " / " $2}')"
echo -e "🧠 Memory:     $(free -h | grep Mem | awk '{print $3 " / " $2}')"

if command -v ollama &> /dev/null; then
	echo -e "🤖 Ollama Models: $(ollama list | wc -l)"
else
	echo -e "🤖 Ollama:        Not Installed"
fi

echo "--------------------------------------------"
echo -e "🧰 Try aliases: \e[1mll, orun, olist, opull\e[0m"
echo ""
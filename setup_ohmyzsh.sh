#!/bin/bash

# 🚀 Script de instalación y configuración de Zsh + Oh My Zsh + Powerlevel10k + Plugins

# 1. Instalar zsh y dependencias
echo "Instalando zsh..."
sudo apt update && sudo apt install -y zsh git curl

# 2. Cambiar shell por defecto al usuario actual
echo "Cambiando shell por defecto a zsh..."
sudo chsh -s $(which zsh) $(whoami)

# 3. Instalar Oh My Zsh
echo "Instalando Oh My Zsh..."
export RUNZSH=no   # evita que se lance zsh inmediatamente
export CHSH=no     # evita que el instalador intente cambiar shell otra vez
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 4. Instalar Powerlevel10k en la carpeta de themes
echo "Instalando Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 5. Configurar Powerlevel10k como tema en ~/.zshrc
echo "Configurando Powerlevel10k como tema..."
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# 6. Instalar plugins recomendados
echo "Instalando plugins recomendados..."
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-history-substring-search \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# 7. Activar plugins en ~/.zshrc
echo "Activando plugins en ~/.zshrc..."
sed -i 's/^plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting history-substring-search)/' ~/.zshrc

# 8. Crear archivo de configuración de Powerlevel10k con tus valores del wizard
echo "Generando configuración personalizada de Powerlevel10k..."
cat p10k.config > ~/.p10k.zsh

# 9. Asegurar que ~/.zshrc cargue ~/.p10k.zsh
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc

echo "✅ Instalación y configuración completadas. Reinicia tu terminal o ejecuta 'exec zsh' para aplicar los cambios."

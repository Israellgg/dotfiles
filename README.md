# Dotfiles - Israel Fernandes

Este repositório contém os arquivos de configuração (dotfiles) para personalizar o seu ambiente. Siga a ordem abaixo para instalar e configurar os componentes sem conflitos.

---

## 1. Gerenciamento dos Dotfiles com GNU Stow

### a) Organização dos Arquivos

Certifique-se de que as pastas estão organizadas conforme a hierarquia do sistema. Por exemplo, tenha pastas como `zsh`, `tmux`, `alacritty`, etc., onde cada pasta contém os arquivos de configuração correspondentes.

### b) Instalação do GNU Stow

```bash
sudo apt install stow -y
```

### c) Aplicando os Symlinks

No diretório raiz dos dotfiles, execute o comando para criar os symlinks do grupo desejado. Por exemplo, para os arquivos de configuração do Zsh:

```bash
stow zsh
```

Para desfazer os symlinks, utilize:

```bash
stow -D zsh
```

Repita o comando para cada grupo (tmux, alacritty, etc.) conforme necessário.

---

## 2. Configuração do Zsh e Plugins

### a) Instalação do Zsh

```bash
sudo apt install zsh -y
chsh -s /usr/bin/zsh
```

> **Nota:** Ao abrir um novo terminal, escolha a opção **2. default** para definir o ambiente padrão.

### b) Instalação dos Plugins para Zsh

#### i. zsh-autosuggestions

Crie a pasta para plugins (caso ainda não exista) e clone o repositório:

```bash
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

Adicione ao seu `~/.zshrc`:

```bash
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
```

#### ii. zsh-syntax-highlighting

Clone o repositório:

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
```

Adicione ao final do seu `~/.zshrc` (antes do plugin de histórico):

```bash
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

#### iii. zsh-history-substring-search

Clone o repositório:

```bash
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
```

Adicione ao `~/.zshrc`:

```bash
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
```

---

## 3. Configuração do Tmux

### a) Instalação do Tmux

```bash
sudo apt install tmux -y
```

Edite o arquivo de configuração:

```bash
vim ~/.tmux.conf
```

### b) Instalação do TPM (Tmux Plugin Manager)

Clone o repositório do TPM:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Recarregue a configuração do Tmux:

```bash
tmux source ~/.tmux.conf
```

Dentro do Tmux, instale os plugins com:

```bash
ctrl+a I
```

---

## 4. Configuração do Terminal

### Instalação do Alacritty

```bash
sudo apt install alacritty -y
```

> **Observação:** Crie e organize a pasta de configuração do Alacritty conforme a estrutura definida nos dotfiles.

---

## 5. Configuração do Powerlevel10k

### a) Instalação do Powerlevel10k

Crie uma pasta temporária (se necessário):

```bash
mkdir ~/.temp
```

Clone o repositório do Powerlevel10k:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```

Configure o Powerlevel10k conforme as instruções do repositório ou personalize via `~/.zshrc`.

---

## 6. Ferramentas Alternativas em Rust

### a) Instalação do Cargo (se necessário)

```bash
sudo apt install cargo -y
```

### b) Instalação do EXA e BAT

Utilize o Cargo para instalar as ferramentas:

```bash
cargo install exa bat
```

---

## Ordem de Execução Recomendada

1. **Gerencie os Dotfiles:** Clone este repositório, organize as pastas e aplique os symlinks com o GNU Stow.
2. **Configure o Zsh:** Instale o Zsh, altere o shell padrão e configure os plugins no `~/.zshrc`.
3. **Configure o Tmux:** Instale o Tmux, configure o arquivo `~/.tmux.conf` e instale o TPM.
4. **Configure o Terminal:** Instale e configure o Alacritty.
5. **Configure o Powerlevel10k:** Instale e personalize o prompt Powerlevel10k para o Zsh.
6. **Ferramentas em Rust:** Instale o Cargo e, em seguida, o EXA e o BAT para uma melhor experiência no terminal.


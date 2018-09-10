# BEAGLE
BEAGLE - Biblioteca Educacional para Aprendizado Gráfico de Lógica em Escolas; Trabalho de conclusão de curso para o curso de Tecnologia em Análise e Desenvolvimento de Sistemas pela Universidade Federal do Parana

Este repositório contém apenas arquivos de desenvolvimento. Clone os arquivos para trabalhar sob versionamento.

### Instalando o git
Abra o Bash do Ubuntu no Windows 10 (ou utilizando alguma versão do Linux, se você for mais sensato) e instale o git:
```
sudo apt-get update
sudo apt-get install git
```

### Configurando o arquivo gitignore 
Instale o nano (ou outro editor à sua disposição):
```
sudo apt-get update
sudo apt-get install nano
```

### Configurando o versionamento dos projetos
Inicie o versionamento do projeto no local onde os projetos já existem:

```
(Ubuntu Windows)
cd ../../mnt/c/Users/"SEU USUÁRIO"/"CAMINHO DO PROJETO"
```
OU
```
(Linux)
cd /"CAMINHO DO PROJETO"
```

Após isso, inicie o repositório git:
```
git init
```
Adicione o repositório do projeto:
```
git remote add origin https://github.com/lgehlen/beagle.git
git fetch origin master
git merge origin/master
```

Configure o gitignore no seu git local e crie um novo arquivo gitignore
```
git config --global core.excludesfile .gitignore 
```

### Preparar versionamento para desenvolvimento
Cada desenvolvedor deverá criar uma nova branch de desenvolvimento para cada nova funcionalidade. Para acessar a branch criada:
```
git fetch origin
git checkout nomeDaBranch
```
Para atualizar sua branch com o mais recente desenvolvido:
```
git merge origin/master
```

### Realizar upload dos desenvolvimento realizado
Realize o commit do trabalho realizado
```
git status (para visualizar os arquivos modificados - em vermelho)
git add caminho/do/arquivo (realize essa etapa para todos os arquivos em vermelho que deseja adicionar - caso deseje adicionar todos os arquivos em vermelho, utilize o comando "git add .")

git commit -m "Mensagem do commit, entre aspas duplas"

git push (entre com o seu usuário e senha do gitHub)
```
### Restaurar versão de arquivos modificados
Caso mexeu indevidamente em um arquivo e deseja restaurar a versão anterior, realize os seguintes passos:
```
git status (encontre o arquivo que deseja)
git checkout -- caminho/do/arquivo
OU
git checkout -- . (para todos os arquivos em vermelho)

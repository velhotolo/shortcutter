# ⌨️ Shortcut Tracker

![Lua](https://img.shields.io/badge/Lua-5.5-2C2D72?style=for-the-badge&logo=lua)
![SQLite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite)
![Status](https://img.shields.io/badge/Status-Ativo-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

O Commit do dia 31/10/26 foi feito por engano porque eu uso vários terminais abertos pra abrir os arquivos pelo Micro. Os arquivos upados estão cheios de erros e a tela nem desenha como deveria, provavelmente por conta do arquivo do tema. Então é isso, não tem nada pra ver. 
Eu tentaria reverter e/ou deletar, mas é tão burocrático que eu ganho mais estudando alguma coisa. Obrigado!

Um aplicativo de desktop leve e direto ao ponto para salvar, organizar e consultar atalhos de teclado. Desenvolvido para manter as combinações de teclas mais importantes sempre à mão, otimizando o fluxo de trabalho sem a necessidade de recorrer a buscas na internet ou em manuais.

## ✨ Funcionalidades
* **Cadastro Rápido:** Registre o nome do software, o atalho de teclado (ex: `Ctrl + Shift + F`) e a ação correspondente.
* **Acesso Imediato:** Interface gráfica limpa para listar e consultar todos os atalhos cadastrados em uma única tela.
* **Persistência de Dados:** As informações são salvas localmente através de um banco de dados estruturado, garantindo que nada se perca ao fechar o programa.

## 🛠️ Stack Tecnológico
* **Linguagem:** Lua 5.5
* **Interface Gráfica:** LWTK (Light Window Toolkit)
* **Banco de Dados:** SQLite

## 🚀 Como Executar

1. Certifique-se de ter o **Lua 5.5** configurado no seu ambiente.
2. Verifique se a biblioteca **LWTK** e o driver do **SQLite** para Lua estão instalados.
3. Baixe ou clone este repositório para a sua máquina.
4. Execute o script principal diretamente pelo terminal:
   ```bash
   lua main.lua
   ```

## 📖 Guia de Uso

1. **Abrindo o Aplicativo:** Ao iniciar o programa, você verá a interface principal com a lista de atalhos (inicialmente vazia ou exibindo os itens salvos anteriormente).
2. **Adicionando um Novo Atalho:**
   * Localize os campos de entrada na tela.
   * Em **Software**, digite o nome do programa (ex: *Micro*, *VSCode*, *Blender*).
   * Em **Shortcut**, digite a combinação de teclas (ex: *Ctrl + Q*).
   * Em **Action**, descreva o que o atalho faz (ex: *Sair do programa*).
   * Clique no botão de salvar/adicionar para registrar a informação.
3. **Consulta Visual:** Os atalhos cadastrados aparecerão imediatamente na lista abaixo, organizados para leitura rápida sempre que você esquecer um comando.

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes. O uso, modificação e distribuição são totalmente livres, bastando manter o aviso de direitos autorais.

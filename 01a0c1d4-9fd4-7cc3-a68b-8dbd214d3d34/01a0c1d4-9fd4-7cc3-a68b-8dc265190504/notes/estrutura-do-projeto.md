---
tags:
- arquitetura
- codigo
- interface
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.3.2
  at: 2026-09-22T04:20:14Z
---
# Estrutura do código e da interface

O projeto usa Python 3.12 ou superior. Regras e transformações ficam principalmente em funções; classes encapsulam coletores, clientes, conexões e estado de execução. `main.py` e `scraper/config.py` recebem a configuração; `scraper/sources/` contém um coletor por portal; `scraper/pipeline.py` coordena a coleta; `scraper/rules/*.yml` guarda vocabulários e filtros curados.

`api/` reúne persistência SQLite, modelos, migrações e validação de snapshots: não é um servidor HTTP. A interface fonte fica em `.github/web/`; `api/web/` contém JSON gerado e ignorado pelo Git. O GitHub Pages publica esses arquivos estáticos. O projeto evita uma camada genérica de serviços/repositórios que não existe no código atual.

Referências verificadas em 22/09/2026: `docs/arquitetura.md`, `pyproject.toml` e `.gitignore`.
# 🔍 Codebase Quality & Architecture Auditors

> Ferramentas de análise estática e auditoria arquitetural para garantir o equilíbrio do repositório.

---

## 🎯 Finalidade

Esta pasta centraliza os scripts de inspeção de código para manter o repositório em conformidade estrita com o [`PRINCIPLES.md`](../../PRINCIPLES.md):

- **Equilíbrio Arquitetural:** Nem monólitos gigantes (> 100 linhas), nem micro-scripts excessivamente fragmentados (< 15 linhas).
- **Legibilidade no GitHub:** Facilitar a consulta direta das receitas no navegador.

---

## 📂 Catálogo de Ferramentas

| Ferramenta                     | Linguagem | Descrição                                                                         |
| :----------------------------- | :-------- | :-------------------------------------------------------------------------------- |
| [`monoliths.py`](monoliths.py) | Python 3  | Detecta scripts que ultrapassam o limite de 100 linhas (com suporte a whitelist)  |
| [`nanos.py`](nanos.py)         | Python 3  | Detecta micro-scripts com menos de 15 linhas para sugerir consolidações temáticas |

---

## 🚀 Como Executar

Execute a partir da raiz do repositório:

```sh
# Auditar monólitos (> 100 linhas)
python3 scripts/audit/monoliths.py

# Auditar micro-scripts (< 15 linhas)
python3 scripts/audit/nanos.py
```

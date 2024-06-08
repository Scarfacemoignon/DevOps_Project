# SuperCalculator

## Introduction

SuperCalculator est un projet développé chez SuperMath, une entreprise spécialisée dans les calculs mathématiques avancés. Ce projet vise à créer une calculatrice avec une puissance de calcul équivalente à celle du terminator. Le projet est écrit en Go et comprend des tests unitaires pour garantir sa qualité.

## Dépendances

- Go 1.17, 1.18, 1.19
- Docker

## Workflows GitHub Actions

Le projet SuperCalculator utilise GitHub Actions pour automatiser différentes tâches telles que le linting, les tests et la création de releases. Voici une vue d'ensemble des workflows disponibles :

1. **Release Workflow** : Ce workflow est déclenché lorsqu'un tag est créé dans le dépôt. Il utilise goreleaser pour compiler le projet pour différentes plates-formes et crée une image Docker en fonction du tag de version.

2. **Lint Workflow** : Ce workflow est déclenché par les événements pull_request, push et les déclencheurs manuels. Il effectue une analyse statique avec Semgrep, une analyse du Dockerfile avec Hadolint et une exécution de Super-Linter pour vérifier la qualité du code.

3. **Test Workflow** : Ce workflow est déclenché à chaque push et vise à exécuter les tests unitaires du projet sur les versions 1.17, 1.18 et 1.19 de Go.

## Instructions d'Utilisation

Pour contribuer au projet ou l'utiliser localement, suivez ces étapes :

1. Clonez le dépôt sur votre machine locale :

```bash
git clone https://github.com/votre-utilisateur/SuperCalculator.git
cd SuperCalculator
```

- Installez Go (si ce n'est pas déjà fait)
- Assurez-vous que votre version de Go est 1.17, 1.18 ou 1.19
- Installez Docker (si ce n'est pas déjà fait)

# Exécutez les tests unitaires
```Commande
go test ./...
```
N'oubliez pas de personnaliser ce README en fonction des détails spécifiques de votre projet, tels que le contenu des workflows, les dépendances et les instructions d'installation.

# SuperCalculator

## Introduction

**SuperCalculator** est un projet développé par **SuperMath**, une entreprise renommée pour ses solutions de calculs mathématiques avancés. SuperCalculator est conçu pour être une calculatrice ultra-puissante, capable de traiter des calculs mathématiques complexes avec une efficacité et une rapidité remarquables, grâce à sa base de code écrite en Go.

## Fonctionnalités

- **Calculs Avancés** : SuperCalculator peut gérer des opérations mathématiques très complexes, y compris l'algèbre linéaire, le calcul différentiel et intégral, et bien plus encore.
- **Performances Optimisées** : Écrit en Go, SuperCalculator tire parti de la gestion efficace des threads et des performances optimales de ce langage pour offrir des calculs rapides.
- **Support Multi-Plateforme** : SuperCalculator est compilé pour fonctionner sur plusieurs systèmes d'exploitation, incluant Windows, macOS, et Linux.
- **Intégration Docker** : L'application peut être déployée facilement en tant qu'image Docker, facilitant son utilisation dans des environnements de production.
- **Automatisation DevOps** : Grâce à l'intégration de GitHub Actions, les tâches de développement telles que le déploiement, les tests et l'analyse statique sont automatisées.

## Installation

### Prérequis

- **Go** : Vous devez avoir Go installé sur votre système. [Télécharger Go](https://golang.org/dl/)
- **Docker** : Pour exécuter l'application via Docker, assurez-vous que Docker est installé. [Télécharger Docker](https://www.docker.com/get-started)

### Cloner le Répertoire

Clonez le dépôt SuperCalculator sur votre machine locale :

```bash
git clone https://github.com/Scarfacemoignon/DevOps_Project.git
cd DevOps_Project
go run main.go
```


## Infrastructure DevOps

### GitHub Actions

SuperCalculator utilise GitHub Actions pour automatiser plusieurs processus critiques de développement. Voici les principaux workflows configurés pour ce projet :

#### 1. Release Workflow

Ce workflow est déclenché lorsque des tags de version sont créés. Il effectue les tâches suivantes :
- Utilisation de **GoReleaser** pour compiler le projet pour différentes plateformes (Windows, macOS, Linux).
- Génération des artefacts de version, incluant les binaires compilés.
- Création d'une image Docker en utilisant le Dockerfile du projet.
- Publication de l'image Docker sur Docker Hub avec le tag correspondant au nom de la version.

**Exemple de tag Docker** :
Si le tag GitHub est `v1.1.2`, l'image Docker sera publiée comme `scarface05/devops_project:v1.1.2`.

#### 2. Lint Workflow

Ce workflow s'exécute lors de plusieurs événements :
- `pull_request`
- `push`
- Manuellement via une action GitHub

Il exécute les tâches suivantes :
- Analyse statique du code source avec **Semgrep** en utilisant les règles par défaut.
- Analyse du Dockerfile avec **Hadolint**.
- Exécution de **Super-Linter** pour des vérifications de linting supplémentaires, uniquement si l'événement est déclenché par un `pull_request`.

#### 3. Test Workflow

Ce workflow est déclenché pour chaque `push` et vise à exécuter les tests unitaires du projet. Les tests sont exécutés sur plusieurs versions de Go (1.17, 1.18 et 1.19) pour assurer la compatibilité.

**Commande de test** :
```bash
go test ./...

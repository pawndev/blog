---
title: "Mes conventions de nommage git"
date: 2023-04-21
lastmod: 2023-04-21
# publishDate: 2023-04-21T14:00:00+02:00
draft: false
description: "Mes conventions de nommage git pour les branches et commit"
summary: "Mes conventions de nommage git pour les branches et commit"
tags: ['git', 'convention']
categories: ['git']
# featuredImage: '/images/git.png'
# featuredImagePreview: ''
resources:
- name: featured-image
  src: images/git.png
---

## Une note pour le futur moi

Ce poste a pour but d'expliquer comment je nomme mes commits, branches, dans mes projets git. Ce n'est pas un standard.
Il m'arrive de déroger à mes propres règles.

## Commit

Tout commence avec la [spec du conventional commit d'angular](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines).
Comme mes projets contiennent certes du code, mais aussi d'autres types de ressources, j'ai pensé qu'il manquait potentiellement des `type` dans la spec du conventional commit.
J'ai donc ajouté le type `infra` dans ma convention personnelle.

Voici la liste de mes types :

| Type     | Description                                                    | Exemple                                              |
|----------|----------------------------------------------------------------|------------------------------------------------------|
| feat     | Une nouvelle fonctionnalité                                    | feat(settings): Ability to change user email         |
| fix      | Une correction de bogue                                        | fix(settings): Handle empty user email               |
| docs     | Changement dans la documentation                               | docs(readme): How to start project                   |
| style    | Changement qui n'impacte pas la signification du code          | style(whitespace): Add before return                 |
| refactor | Code pour refactoriser une partie de l'application             | refactor(settings): split create and update handlers |
| perf     | Code qui améliore les performances                             | perf(handler): Remove sleep(1000)                    |
| test     | Ajout ou modification de tests                                 | test(settings): add empty email test case            |
| build    | Changement qui modifie les builds ou les dépendances externes  | build: Separate build in chunks                      |
| ci       | Changement dans la configuration de la CI                      | ci(lint): Use golangci-lint action                   |
| chore    | Autre changement qui ne touche pas aux tests ou au code source | chore: .DS_STORE in gitignore                        |
| revert   | Annule un commit précédent                                     |                                                      |
| infra    | Un changement dans les manifestes/fichiers d'infrastructure    | infra(k8s/ingress): Add TLS                          |

### Commit body

Je ne remplis pas souvent le `body` des commits, mais quand je le fais, j'ajoute simplement une brève description de ce que mon commit apporte.

## Branche

Les noms de mes branches sont construits de manière très simple et ressemblent beaucoup au nommage de mes commits.

Ils commencent tous par un `type`, habituellement, les mêmes `type` que mes commits, comme :
- `feat/add-settings-page`
- `fix/handle-null-values-on-settings-update`

Et quand j'ai un outil de suivi de tickets/projets, comme les github projects/issue, ou jira,
j'ajoute le numéro du ticket juste après le `type`, comme :
- `feat/123/add-settings-page`
- `fix/FP-2129/handle-null-values-on-settings-update`

### Release/Hotfix

Pour ces types de branches, c'est assez similaire.
Si mon dépôt git contient une seule application à livrer ou fixer, alors ce sera :
- `release/2.0.0`
- `hotfix/2.0.1`

Et s'ils en contiennent plus d'une :
- `release/user-manager/2.0.0`
- `hotfix/user-manager-importer/1.3.4`

## Fin ?

Je pense que c'est à peu près tout pour mes conventions de nommage perso sur git. Merci d'avoir lu !
---
title: "Personal Git naming convention"
date: 2023-04-18T14:25:07+02:00
lastmod: 2023-04-21
# publishDate: 2023-04-21T14:00:00+02:00
draft: false
description: "My personal git naming convention for branch and commit"
summary: "My personal git naming convention for branch and commit"
tags: ['git', 'convention']
categories: ['git']
# featuredImage: '/images/git.png'
# featuredImagePreview: ''
resources:
- name: featured-image
  src: images/git.png
---

## A note for the future me

This post aims to explain how, actually, I'm naming things in my git projects. It's not a standard or anything.

## Commit

All begin with the [angular conventional commit specification](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines).
But, as of my projects were not just application code, they also contain some infrastructure manifest (terraform, kubernetes, etc.) I thought there were some missing `type`
in the conventional commit spec. I just added one in my personal workflow, the type `infra`.

Here in a table my usual commit type, with some example.

| Type     | Description                                                   | Example                                              |
|----------|---------------------------------------------------------------|------------------------------------------------------|
| feat     | A new feature                                                 | feat(settings): Ability to change user email         |
| fix      | A bug fix                                                     | fix(settings): Handle empty user email               |
| docs     | Documentation only changes                                    | docs(readme): How to start project                   |
| style    | Changes that do not affect the meaning of the code            | style(whitespace): Add before return                 |
| refactor | A code change that neither fixes a bug nor adds a feature     | refactor(settings): split create and update handlers |
| perf     | A code change that improves performance                       | perf(handler): Remove sleep(1000)                    |
| test     | Adding missing tests or correcting existing tests             | test(settings): add empty email test case            |
| build    | Changes that affect the build system or external dependencies | build: Separate build in chunks                      |
| ci       | Changes to our CI configuration files and scripts             | ci(lint): Use golangci-lint action                   |
| chore    | Other changes that don't modify src or test files             | chore: .DS_STORE in gitignore                        |
| revert   | Reverts a previous commit                                     |                                                      |
| infra    | A change in the infrastructure code/manifest                  | infra(k8s/ingress): Add TLS                          |

### Commit body

I don't use body in my commit very often, but when I do, I just simply write a breve description about what my commit do.

## Branch

My naming is pretty simple for the naming of a branch, and is similar of the conventional commit spec.

They always begin with a `type` too, usually, I use the same type as my commit, like:
- `feat/add-settings-page`
- `fix/handle-null-values-on-settings-update`

And when I have an issue/project tracking software, like GitHub projects/issue, or jira,
I'm adding the ticket number just after the type, like:
- `feat/123/add-settings-page`
- `fix/FP-2129/handle-null-values-on-settings-update`

### Release/Hotfix

For these kind of branch, it's pretty similar
If my repository contains only one application to release/fix, then it will be;
- `release/2.0.0`
- `hotfix/2.0.1`

And, if it contains more than one application, it'll be;
- `release/user-manager/2.0.0`
- `hotfix/user-manager-importer/1.3.4`

## The end.

I think that's all for my personal convention about naming things in git. If you reach this far, thanks for reading !
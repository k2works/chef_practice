実践Chef
=============
# 目的
アプリケーション実行環境の自動構築

# 前提
| ソフトウェア   | バージョン   | 備考        |
|:---------------|:-------------|:------------|
| OS X           |10.9.2        |             |
| Chef Development Kit  |0.1.0  |             |
| vagrant        |1.6.0         |             |

+ [Hub](https://github.com/github/hub)
+ [Knife-spec](https://github.com/sethvargo/knife-spec)
+ [Chef-DK入門](https://github.com/k2works/Chef-DK_introduction)

# 構成
+ [セットアップ](#1)
+ [PHP環境を導入する](#2)
+ [Ruby環境を構築する](#3)
+ [MySQLを構築する](#4)
+ [Fluentedを構築する](#5)

# 詳細
## セットアップ
```bash
$ chef generate app chef_practice
Compiling Cookbooks...
Recipe: code_generator::app
  * directory[/Users/k2works/projects/github/chef_practice] action create
    - create new directory /Users/k2works/projects/github/chef_practice

  * template[/Users/k2works/projects/github/chef_practice/.kitchen.yml] action create
    - create new file /Users/k2works/projects/github/chef_practice/.kitchen.yml
    - update content in file /Users/k2works/projects/github/chef_practice/.kitchen.yml from none to 325674
        (diff output suppressed by config)

  * template[/Users/k2works/projects/github/chef_practice/README.md] action create
    - create new file /Users/k2works/projects/github/chef_practice/README.md
    - update content in file /Users/k2works/projects/github/chef_practice/README.md from none to 6700ec
        (diff output suppressed by config)

  * directory[/Users/k2works/projects/github/chef_practice/cookbooks] action create
    - create new directory /Users/k2works/projects/github/chef_practice/cookbooks

  * directory[/Users/k2works/projects/github/chef_practice/cookbooks/chef_practice] action create
    - create new directory /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice

  * template[/Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/metadata.rb] action create
    - create new file /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/metadata.rb
    - update content in file /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/metadata.rb from none to f054c6
        (diff output suppressed by config)

  * cookbook_file[/Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/chefignore] action create
    - create new file /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/chefignore
    - update content in file /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/chefignore from none to f2a74d
        (diff output suppressed by config)

  * cookbook_file[/Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/Berksfile] action create
    - create new file /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/Berksfile
    - update content in file /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/Berksfile from none to 303039
        (diff output suppressed by config)

  * directory[/Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/recipes] action create
    - create new directory /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/recipes

  * template[/Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/recipes/default.rb] action create
    - create new file /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/recipes/default.rb
    - update content in file /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/recipes/default.rb from none to d6c07b
        (diff output suppressed by config)

  * execute[initialize-git] action run
    - execute git init .

  * cookbook_file[/Users/k2works/projects/github/chef_practice/.gitignore] action create
    - create new file /Users/k2works/projects/github/chef_practice/.gitignore
    - update content in file /Users/k2works/projects/github/chef_practice/.gitignore from none to 05eef0
        (diff output suppressed by config)
$ cd chef_practice
$ git create
Updating origin
created repository: k2works/chef_practice
$ git add .
$ git commit -am "Setup"
[master (root-commit) 4545148] Setup
 3 files changed, 67 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 .kitchen.yml
 create mode 100644 README.md
$ git push origin master
Counting objects: 5, done.
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 947 bytes | 0 bytes/s, done.
Total 5 (delta 0), reused 0 (delta 0)
To git@github.com:k2works/chef_practice.git
 * [new branch]      master -> master
```

## PHP環境を導入する

## Ruby環境を構築する

## MySQLを構築する

## Fluentedを構築する

# 参照

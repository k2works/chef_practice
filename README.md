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
### nginxを導入する
#### クックブックを作成する
```bash
$ knife cookbook create nginx -o ./site-cookbooks
WARNING: No knife configuration file found
** Creating cookbook nginx
** Creating README for cookbook: nginx
** Creating CHANGELOG for cookbook: nginx
** Creating metadata for cookbook: nginx
** Creating specs for cookbook: nginx
```
#### レシピを作成する
_site-cookbooks/nginx/recipes/default.rb_
```ruby
include_recipe "yum-epel"

package "nginx" do
  action :install
end

service "nginx" do
  action [ :enable, :start ]
  supports :status => true, :restart => true, :reload => true
end
```
#### Berksfileを編集する
```bash
$ cd cookbokks/chef_practice
$ berks init
   identical  Berksfile
      create  Thorfile
    conflict  chefignore
Overwrite /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/chefignore? (enter "h" for help) [Ynaqdh] Y
       force  chefignore
      create  .gitignore
         run  git init from "."
      create  Gemfile
      create  .kitchen.yml
      append  Thorfile
      create  test/integration/default
      append  .gitignore
      append  .gitignore
      append  Gemfile
      append  Gemfile
You must run `bundle install' to fetch any new gems.
      create  Vagrantfile
Successfully initialized
```
_cookbooks/chef_practice/Berksfile_
```yum
source "https://api.berkshelf.com"

metadata

cookbook "yum-epel"
cookbook "nginx", path: "../../site-cookbooks/nginx"
```
_cookbooks/chef_practice/metadata.rb_
```ruby
name             'chef_practice'
maintainer       ''
maintainer_email ''
license          ''
description      'Installs/Configures '
long_description 'Installs/Configures '
version          '0.1.0'
```

#### berks vendorコマンド実行
```bash
$ berks vendor
Resolving cookbook dependencies...
Fetching 'chef_paractice' from source at .
Fetching 'nginx' from source at ../../site-cookbooks/nginx
Fetching cookbook index from https://api.berkshelf.com...
Using chef_paractice (0.1.0) from source at .
Using yum (3.2.0)
Using nginx (0.1.0) from source at ../../site-cookbooks/nginx
Using yum-epel (0.3.6)
Vendoring chef_paractice (0.1.0) to /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/berks-cookbooks/chef_paractice
Vendoring nginx (0.1.0) to /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/berks-cookbooks/nginx
Vendoring yum (3.2.0) to /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/berks-cookbooks/yum
Vendoring yum-epel (0.3.6) to /Users/k2works/projects/github/chef_practice/cookbooks/chef_practice/berks-cookbooks/yum-epel
```
#### Vagrantfileを編集する
_cookbooks/chef_practice/Vagrantfile_
```ruby
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.hostname = "chef-practice-berkshelf"
  config.vm.box = "opscode_centos-6.5"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.4_chef-provisionerless.box"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.omnibus.chef_version = :latest

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.run_list = %w[
        recipe[chef_practice::default]
        recipe[yum-epel]
        recipe[nginx]
    ]
  end
end
```
_cookbooks/chef_practice/bootstrap.sh_
```bash
if [ ! $(grep single-request-reopen /etc/sysconfig/network) ]; then
  echo RES_OPTIONS=single-request-reopen >> /etc/sysconfig/network && service network restart;
fi
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
yum update -y
```
#### プロビジョニングを実行する
```bash
$ vagrant up --provision
```
### PHPを導入する
#### クックブックを作成する
```bash
$ knife cookbook create php-env -o ./site-cookbooks
```
#### レシピを作成する
_site-cookbooks/php-env/recipes/default.rb_
```ruby
%w{php-fpm}.each do |pkg|
  package pkg do
    action :install
    notifies :restart, "service[php-fpm]"
  end
end

service "php-fpm" do
  action [:enable, :start]
end
```
#### Vagrantfileを編集する
_cookbooks/chef_practice/Vagrantfile_
```ruby
・・・
  config.vm.provision :chef_solo do |chef|
    chef.run_list = %w[
        recipe[chef_practice::default]
        recipe[yum-epel]
        recipe[nginx]
        recipe[php-env]
    ]
  end
end
```
#### Berksfileを編集する
_cookbooks/chef_practice/Berksfile_
```
source "https://api.berkshelf.com"

metadata

cookbook "yum-epel"
cookbook "nginx", path: "../../site-cookbooks/nginx"
cookbook "php-env", path: "../../site-cookbooks/php-env"
```
#### プロビジョニングを実行する
```bash
$ berks update
$ vagrant provision
```
#### nginxの設定を調整する
_site-cookbooks/nginx/templates/default/nginx.conf.erb_
#### レシピを修正する
_site-cookbooks/nginx/recipes/default.rb_
```ruby
・・・
template 'nginx.conf' do
  path '/etc/nginx/nginx.conf'
  source "nginx.conf.erb"
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reload, "service[nginx]"
end
```
_site-cookbooks/nginx/attributes/default.rb_
```ruby
site-cookbooks/nginx/attributes/default.rb
```
_cookbooks/chef_practice/Vagrantfile_
```ruby
・・・
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      nginx: {
        env: ["php"]
      }
    }
    chef.run_list = %w[
        recipe[chef_practice::default]
        recipe[yum-epel]
        recipe[nginx]
        recipe[php-env]
    ]
  end
end
```
#### プロビジョニングを実行する
```bash
$ berks update
$ vagrant provision
```

### OPcacheを導入する
#### レシピを修正する
_site-cookbooks/php-env/recipes/default.rb_
```ruby
%w{php-fpm php-pecl-zendopcache}.each do |pkg|
  package pkg do
    action :install
    notifies :restart, "service[php-fpm]"
  end
end

service "php-fpm" do
  action [:enable, :start]
end
```
#### プロビジョニングを実行する
```bash
$ berks update
$ vagrant provision
```
#### 動作を確認
ゲスト側でテスト用のPHPスクリプトを作成して確認
_/usr/share/nginx/html/index.php_
```php
<?php
phpinfo();
?>
```
### PHP5.5をインストールする
#### レシピを作成する
_site-cookbooks/php-env/recipes/php55.rb_
#### PHP5.3と共存しないようにVagrantfileを編集する
_cookbooks/chef_practice/Vagrantfile_
```ruby
・・・
  chef.run_list = %w[
      recipe[chef_practice::default]
      recipe[yum]
      recipe[yum-epel]
      recipe[nginx]
      recipe[php-env::php55]
  ]
  end
end
```
#### プロビジョニングを実行する
```bash
$ vagrant ssh -c "sudo yum remove php* -y"
$ berks update
$ vagrant provision
```

## Ruby環境を構築する

## MySQLを構築する

## Fluentedを構築する

# 参照
+ [Slow networking (due to IPv6?) on CentOS 6.x](https://github.com/mitchellh/vagrant/issues/1172)

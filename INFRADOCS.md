# Development and Production Setup

## Development setup

### Local dev with WSL2

Using Vscode for projects running inside WSL2:

[Vscode Remote Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)


### ASDF to manage multiple package versions

Add packages versions to manage
```sh
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
```

Install Erlang dependencies
```sh
sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk
```

Erlang config options
```sh
export KERL_BUILD_DOCS=yes
export KERL_INSTALL_HTMLDOCS=no
export KERL_INSTALL_MANPAGES=no
```

List available versions and install
```sh
asdf list-all erlang
asdf install erlang 25.0.1
asdf list-all elixir
asdf install elixir main-otp-25
```

Set global version
```sh
asdf global erlang 25.0.1
asdf global elixir main-otp-25
```

Install Hex and Phoenix
```sh
mix local.hex
mix archive.install hex phx_new
```

### Local database server

Local Postgresql
```sh
# check service status
pg_lsclusters

# start postgresql service
sudo service postgresql start
```

Useful commands
```sh
# change to postgres user & psql cli
sudo -u postgres psql
```
### Local Phoenix setup


```sh
mix phx.new blokos_dev
cd blokos_dev

# after dependencies change
mix deps.get

mix credo gen.config

# save postgres local pass to env
export POSTGRES_DEV_PASS=<password>

# secret salt
mix phx.gen.secret
export SECRET_SALT=<secret>

# create dev database
mix ecto.create

# can run app inside IEx
iex -S mix phx.server
```

Useful commands
```sh
# change to postgres user & psql cli
sudo -u postgres psql
```

## Production setup

### Fly.io app setup and deployment

Login to Fly.io, setup project skeleton and launch
```sh
# Login from console instead of browser with -i
flyctl auth login -i

# One command to launch app and provision DB
fly launch
```

Deploy again after changes, and open URL
```sh
fly deploy
fly open
```

Fix git commit email privacy issues
```sh
git config --global user.email {username}@users.noreply.github.com
git commit --amend --reset-author
```

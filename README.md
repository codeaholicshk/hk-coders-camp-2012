hk-coders-camp-2012
===================

Hong Kong Code Camp 2012 Registration Page

## Getting Started with development
### Installing Mongodb

For Mac OSX with homebrew installed:

    brew update
    brew install mongodb

Load mongodb on login:

    mkdir -p ~/Library/LaunchAgents
    cp /usr/local/Cellar/mongodb/2.2.0-x86_64/homebrew.mxcl.mongodb.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

### Checkout project files and install gem

Checkout repo:

    git clone git://github.com/codeaholicshk/hk-coders-camp-2012.git

Install gem:

    cd hk-coders-camp-2012
    gem install bundler
    bundle install

### Start local web server

Seeding admin account:

    padrino rake seed

Launch development environment:

    padrino start

Access website from your web browser:
`http://127.0.0.1:3000`

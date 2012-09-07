hk-coders-camp-2012
===================

Hong Kong Code Camp 2012 Registration Page

## Getting Started with development
### Installing Mongodb

For Mac OSX with homebrew installed:

    brew update
    brew install mongodb

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

    foreman start

Access website from your web browser:
`http://127.0.0.1:3000`

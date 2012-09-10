![Hong Kong Code Camp 2012](http://camp.codeaholics.hk/images/camp_logo.png?1347177601 "Hong Kong Code Camp 2012")

# Hong Kong Code Camp 2012 Registration Page

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
    gem install bundler --pre
    bundle install

### Start local web server

Seeding admin account:

    padrino rake seed

Launch development environment:

    foreman start

Access website from your web browser:
`http://127.0.0.1:3000`

## About this project
### Web App Features

* Propose and Edit Idea
* Coder Registration using Github account
* Comment and vote for ideas after signing in
* Counters of coder registrations and idea publications

### Tech Stacks

* Mongo
* Padrino
* Heroku

### Credits

* [matthewrudy](https://github.com/matthewrudy)
* [linc01n](https://github.com/linc01n)
* [3dd13](https://github.com/3dd13)

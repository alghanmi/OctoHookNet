#OctoHookNet
This is a service acts as a net for all GitHub [Webhooks](https://developer.github.com/v3/repos/hooks/) within a GitHub [organization](https://github.com/blog/674-introducing-organization). This a companion service that works along with the GitHub Course Manager (aka `alghanmi-bot`) I developed as a TA at the University of Southern California.

This application is written as an excercise to get started with ruby and Sinatra and is a work in progress. Use the [isse tracker](https://github.com/alghanmi/OctoHookNet/issues) for questions, comments or suggestions.

###Goals

  1. Record repo events based on the hooks received from GitHub. This will help in:
    + Establishing the actual time-stamp code was pushed to the server, e.g. homework submissions
    + Tracking user interaction, e.g. issues with a lot of interaction or with specific labels
    + Flagging specific events for admin follow-up, e.g. someone using a `git push --force`

  1. Triggering events when receiving specific hooks


##Getting Started
Assuming you are starting with a basic Debian stable setup, here are instructions on how to install the required components. Note that this assumes [this basic VPS setup](https://github.com/alghanmi/vps_setup).

####Dependencies
Here are some development packages needed for the installation of ruby
```bash
sudo aptitude install build-essential libssl-dev libcurl4-openssl-dev libreadline-dev
```

####ruby
We will install ruby using [rbenv](https://github.com/sstephenson/rbenv). So start by configuring rbenv
```bash
#Clone the rbenv version
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

#Update $PATH to include ruby
echo '' >> ~/.bashrc
echo '#ruby Setup' >> ~/.bashrc
echo 'PATH=$HOME/.rbenv/bin:$PATH' >> ~/.bashrc

#Enable shims and auto-complete
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

#Install plugin: ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

#Install plugin: gem-rehash
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

#Reload bashrc
source .bashrc
```

Now, pick the version of ruby you want to install and install it
```bash
#List all available ruby versions
rbenv install -l

#Install v2.1.2 (while keeping the source)
rbenv install 2.1.2 -k

#Set the version of ruby you want to use
rbenv global 2.1.2
```

####Sinatra
Lets install [Sinatra](http://www.sinatrarb.com/) along with some useful gems:
```bash
gem install thin
gem install sinatra
```

# Share.Place

Share.Place is an application based on Ruby on Rails which would allow one to share a location with other people.

Technologies and dependencies used in the App:

* Ruby 2.7.0
* Rails 6.0.2.2
* OpenLayers 5.3.0
* PostgreSQL 12.2

* Gems dependencies: 
  - Devise
  - bootstrap
  - simple_form
  - friendly_id
  - rspec-rails
  - factory_bot_rails
  - faker

* System Dependencies: Considered Mac OS X for installation of Ruby, PostegreSQL
* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Getting Started

### Installing Homebrew
First, we need to install Homebrew. Homebrew allows us to install and compile software packages easily from source.
Open Terminal and run the following command:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
### Installing Ruby
I've used rbenv to install and manage my Ruby versions.
To do this, run the following commands in your Terminal:

```
brew install rbenv ruby-build

# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc
source ~/.zshrc

# Install Ruby
rbenv install 2.7.0
rbenv global 2.7.0
ruby -v
```
### Installing Rails
I've used Rails version 6.0.2.2 and you've to run the following command in your Terminal:
```
gem install rails -v 6.0.2.2
```
Rails is now installed, but in order for us to use the rails executable, we need to tell rbenv to see it:
```
rbenv rehash
```
And now we can verify Rails is installed:
```
rails -v
# Rails 6.0.2.2
```
### Setting Up PostgreSQL
You can install PostgreSQL server and client from Homebrew:
```
brew install postgresql
```
Once this command is finished, it gives you a couple commands to run. Follow the instructions and run them:
```
# To have launchd start postgresql at login:
brew services start postgresql
```
By default the postgresql user is your current OS X username with no password. For example, my OS X user is named ```rahul``` so I can login to postgresql with that username.

## Installation
First, you need to clone the repository. Open Terminal and run the following command:
```
git clone https://github.com/rahul-das/place_sharing_site.git
```
Now, Move into the application directory
```
cd place_sharing_site
```
Modify the config/database.yml file to contain the valid username/password. By default, it can be the system username as username with no password for Mac OS X users.
```
# config/database.yml
username: rahul # change this to your current OS X username
password: 
```
I've added some extra gems in Gemfile; So install the gems using bundle install:
```
bundle install
```
Next step is Database Setup:
```
rails db:create
rails db:migrate
# some users, shared locations
rails db:seed
```
Now you can start the rails server:
```
rails server
```
![Share.Place login page](https://drive.google.com/file/d/1ZQJIw4aR_VtXe70j6SYBC4fmNMfxkihq)

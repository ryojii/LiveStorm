# LiveStorm

This is my code for LiveStorm test.
The goal is to:
- Create automated tests for a Login/Logout in https://www.saucedemo.com/ with Ruby, Capybara, RSpec
- Run the test in CircleCI and BrowserStack

What I have done:
I use pom to create three tests (one happy path and two failed path). Those test can be run with rspec and circleci. Results are send to BrowserStack (according that you properly set the project, see below).

## How to use 
### Circleci
- create your own repo from this one (clone this repo and put the code in yours, needed to use circleci)
- put your BrowserStack's credentials in spec/helper/driver.rb
- branch circleci to your repo (see circleci doc at https://circleci.com/docs/2.0/about-circleci/?section=getting-started)
- launch it (you can do over other things like crossing finger but it should be useless...)

### local
- clone this repo
- put your BrowserStack's credentials in spec/helper/driver.rb
- launch it
 
 Now you can launch test on your local linux machine with the command`rspec spec/*_spec.rb`.
 
__Note__: 
You will certainly need to install some dependencies like chrome, chrome-driver, rspec ... depending on your distrib and settings.

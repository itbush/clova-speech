# Clova-Speech

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clova-speech' 
```

And then execute:

$ bundle install

## Usage
Use of this SDK assumes prior creation of a skill at the LINE Clova Dev Portal. 

An example implementation of this gem, can be found in a sample skill at [Clova Calculator Skill](https://github.com/itbush/CalculatorClovaSkill). While this example utilizies Sinatra to handle HTTP requests, any method should work.


Add this line to your Ruby program:

```require 'clova' ```

### Handling requests/responses
In order to handle the requests and provide the desired response, create a class that inherits from ```Clova::Skill```. Within the class, the function names ``handle_launch``, ``handle_intent``, ``handle_event``, ``handle_session_end``. Within these functions we can define the way our skill responses to Launch, Intent, Event, and Session Ended requests respectively. 

Example usage:

```ruby 
class CustomSkillName < Clova::Skill
  def handle_launch:
    #response to launch request
  end
  
  def handle_intent:
    #response to intent request
  end
   
  def handle_session_end:
  
  end

``` 

#### Handling Intent Requests
In order to gain the information from an Intent Request, you must access the `slot` of the request. (Check [here](https://clova-developers.line.biz/guide/CEK/References/CEK_API.md#CustomExtIntentRequest) for more information on the structure of Intent Requests)

Example: to access the information in slot `num`:
```ruby
request.find_slot_value_by(:num)
```

An simple implementation can be seen in [ClovaCalculatorSkill](https://github.com/itbush/CalculatorClovaSkill/blob/master/calculator_skill.rb)






## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


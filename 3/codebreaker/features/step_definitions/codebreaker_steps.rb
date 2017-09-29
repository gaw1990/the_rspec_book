require 'pry'
class MyOutput
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

Given(/^I am not yet playing$/) do
end

When(/^I start a new game$/) do
  game = Codebreaker::Game.new(my_output)
  game.start('1234')
end

Then(/^I should see "([^"]*)"$/) do |message|
  my_output.messages.should include(message)
end

Given(/^the secret code is "([^"]*)"$/) do |secret|
  @game = Codebreaker::Game.new(my_output)
  @game.start(secret)
end

When(/^I guess "([^"]*)"$/) do |guess|
  @game.guess(guess)
end

Then(/^the mark should be "([^"]*)"$/) do |mark|
  my_output.messages.should include(mark)
end

def my_output
  @output ||= MyOutput.new
end

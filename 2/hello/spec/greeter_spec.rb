describe "RSpec Greeter" do
  it "should say 'Hello Rspec!' when it receives the greet() message" do
    greeter = RSpecGreeter.new
    greeting = greeter.greet
    greeting.should eq "Hello RSpec!"
  end
end


class RSpecGreeter
  def greet
    "Hello RSpec!"
  end
end

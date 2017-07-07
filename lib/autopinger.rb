require './io'
require './pinger'
require 'pry'
require 'sinatra'
require 'twilio-ruby'

class AutoPinger
  def initialize
    @pinger = Pinger.new
  end

  def run
    user_input = IO.prompt_text("Enter a phone number")
    while true
      @pinger.make_call(user_input)
      sleep(60)
    end
  end
end

AutoPinger.new.run

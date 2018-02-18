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
    user_input = IO.prompt_text("Enter a text message")
    while true
      @pinger.send_sms(user_input)
      sleep(2)
    end
  end
end

AutoPinger.new.run

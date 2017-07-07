class Pinger
  FROM = '+19195878341'

  def initialize
    @client = Twilio::REST::Client.new config["account_sid"], config["auth_token"]
  end

  def make_call(input)
    @client.account.calls.create(
      to: input,
      from: FROM,
      url: 'http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient'
    )
  end

  def config
    @secrets ||= begin
      YAML.load(File.read(File.expand_path('../../config/secrets.yml', __FILE__)))
    end
  end
end
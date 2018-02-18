class Pinger
  FROM = [
    '+19195878341',
    '+19197596017',
    '+19195878142',
    '+19198879970',
    '+19193715483'
  ]

  def initialize
    @client = Twilio::REST::Client.new config["account_sid"], config["auth_token"]
  end

  def send_sms(sms_text)
    FROM.each do |number|
      @client.account.messages.create(
        to: '2529044076',
        from: number,
        body: sms_text
      )
    end
  end

  def make_call(input)
    FROM.each do |number|
      @client.account.calls.create(
        to: input,
        from: number,
        url: 'http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient'
      )
    end
  end

  private

  def config
    @secrets ||= begin
      YAML.load(File.read(File.expand_path('../../config/secrets.yml', __FILE__)))
    end
  end
end
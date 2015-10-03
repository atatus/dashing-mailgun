require 'mailgun'

config = YAML.load File.open("mailgun.yml")

SCHEDULER.every '15m', first_in: 0 do |job|
  domain = config[:domain]
  mg_client = Mailgun::Client.new config[:api_key]

  sentResult = mg_client.get "#{domain}/stats", { :limit => 1, :event => 'sent'}
  openedResult = mg_client.get "#{domain}/stats", { :limit => 1, :event => 'opened'}
  clickedResult = mg_client.get "#{domain}/stats", { :limit => 1, :event => 'clicked'}

  send_event('mailgun', {
    sent:    sentResult.to_h['items'][0]['total_count'],
    opens:   openedResult.to_h['items'][0]['total_count'],
    clicks:  clickedResult.to_h['items'][0]['total_count'],
  })
end

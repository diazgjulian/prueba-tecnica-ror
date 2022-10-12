class QueryhMailer < ApplicationMailer
  default from: 'info@chuk_norris.com'

  def send(query, to)
    @query = query
    mail(to: to, subject: 'Chuck Norris Fact Search results', template_path: 'query_mailer', template_name: 'send')
  end
end

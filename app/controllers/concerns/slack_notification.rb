module SlackNotification

  #slack notification for topics
  def slack_notify_to_support_topics(date, name, description, issues, source)
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    notifier.ping "#{date}"+ "#{name}" + "#{description}" + "#{issues}" + "#{source}"
  end

  #slack notification for employee
  def slack_notify_to_support_employee(email, password)
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    notifier.ping "#{email}" + "#{password}"
  end

end
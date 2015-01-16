# Enable syslogd support. Rails logs will be sent to syslog instead of to
# log/*log. Anything other than 'syslog' defaults to file logs.

if AppConfig.log_method.present? && AppConfig.log_method == 'syslog'
  Rails.application.config.before_initialize do
    config.logger = Syslogger.new "elk_rails"
  end
end

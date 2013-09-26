module RailsCasts
  class Logger
    BASE_LOG_LENGTH = 80
    def self.info(message = "")
      if message.present?
        mean = (BASE_LOG_LENGTH - message.length)/2.0
        afterfix = mean.class.to_s == 'Fixnum' ? mean : mean.round + 1
        prefix = BASE_LOG_LENGTH - message.length - afterfix
        prefix = 0 if prefix < 0
        afterfix = 0 if afterfix < 0
        info = '='*prefix + '  ' + message+ '  ' + '='*afterfix
        puts info
      else
        puts '='*(BASE_LOG_LENGTH + 4)
      end
      puts ''
    end

    def self.notice(pre_message = '', after_message = '')
      length = BASE_LOG_LENGTH + 2 - pre_message.length - after_message.length
      length = 0 if length < 0
      puts pre_message + ' ' + '.'*length + ' ' + after_message
    end
  end
end
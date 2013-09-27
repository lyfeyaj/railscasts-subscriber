module RailsCasts
  class Logger
    BASE_LOG_LENGTH = 80
    def self.info(message = "", quiet = false)
      if !quiet
        if message.present?
          prefix = (BASE_LOG_LENGTH - message.length)/2
          afterfix = BASE_LOG_LENGTH - message.length - prefix
          prefix = 0 if prefix < 0
          afterfix = 0 if afterfix < 0
          info = '='*prefix + '  ' + message+ '  ' + '='*afterfix
          puts info
        else
          puts '='*(BASE_LOG_LENGTH + 4)
        end
        puts ''
      end
    end

    def self.notice(pre_message = '', after_message = '', quiet = false)
      if !quiet
        length = BASE_LOG_LENGTH + 2 - pre_message.length - after_message.length
        length = 0 if length < 0
        puts pre_message + ' ' + '.'*length + ' ' + after_message
      end
    end
  end
end
module RailsCasts
  class Logger
    BASE_LOG_LENGTH = 80
    def self.info(message = "", quiet = false)
      if !quiet
        if message.present?
          prefix = (BASE_LOG_LENGTH - full_length(message))/2
          afterfix = BASE_LOG_LENGTH - full_length(message) - prefix
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
        length = BASE_LOG_LENGTH + 2 - full_length(pre_message) - full_length(after_message)
        length = 0 if length < 0
        puts pre_message + ' ' + '.'*length + ' ' + after_message
      end
    end

    def self.print(message = '', quiet = false)
      if !quiet
        puts message
      end
    end

    private

    def self.cjk_word_length(message = '')
      cjk_word_pattern = /([\u4E00-\u9FA5][\u4E00-\u9FA5]*)/
      message.scan(cjk_word_pattern).flatten.compact.join('').length
    end

    def self.full_length(message = '')
      message.length + cjk_word_length(message)
    end
  end
end

module RailsCasts
  class Logger
    def self.info(message = "")
      if message.present?
        mean = (70 - message.length)/2.0
        afterfix = mean.class.to_s == 'Fixnum' ? mean : mean.round + 1
        prefix = 70 - message.length - afterfix
        info = '='*prefix + '  ' + message+ '  ' + '='*afterfix
        puts info
      else
        puts '='*74
      end
      puts ''
    end

    def self.notice(pre_message = '', after_message = '')
      length = 70 - pre_message.length - after_message.length
      puts pre_message + ' ' + '.'*length + ' ' + after_message
    end
  end
end
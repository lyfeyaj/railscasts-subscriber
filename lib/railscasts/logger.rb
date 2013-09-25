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
  end
end
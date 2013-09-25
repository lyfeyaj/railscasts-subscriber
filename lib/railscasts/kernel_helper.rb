module Kernel
  def present?
    case self.class.to_s
    when 'Array', 'String', 'Nokogiri::XML::NodeSet'
      !self.empty?
    when 'NilClass'
      !self.nil?
    else
      raise 'No Method Error.'
    end
  end
end

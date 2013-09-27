module Kernel
  def present?
    !!self && !self.empty?
  end
end
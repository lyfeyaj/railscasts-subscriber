module Kernel
  def present?
    !(respond_to?(:empty?) ? empty? : !self)
  end
end
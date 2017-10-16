class OrderPosition < ActiveRecord::Base
  MAX_INDEX = Float::INFINITY
  unloadable

  after_initialize :init

  def init
    self.index ||= MAX_INDEX
  end

end

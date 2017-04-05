class OrderPosition < ActiveRecord::Base
  MAX_INDEX = 9999
  unloadable

  after_initialize :init

  def init
    self.index ||= MAX_INDEX
  end

end

class Customer < ActiveRecord::Base
  has_many  :transactions

  def name
    self.first_name + ' ' + self.last_name
  end
end

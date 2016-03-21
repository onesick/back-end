class Customer < ActiveRecord::Base
  validates :first_name, length: {minimum: 2}
end

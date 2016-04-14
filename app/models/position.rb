class Position < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :portfolio
  belongs_to :stock
end

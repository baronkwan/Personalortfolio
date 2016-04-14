class Stock < ActiveRecord::Base
  # Remember to create a migration!
 has_many :positions, dependent: :destroy
 has_many :portfolios, through: :positions

 accepts_nested_attributes_for :positions, :portfolios
end

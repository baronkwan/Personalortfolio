class Portfolio < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :owner, class_name: "User"
  has_many :positions, dependent: :destroy
  has_many :stocks, through: :positions

  accepts_nested_attributes_for :positions, :stocks

end

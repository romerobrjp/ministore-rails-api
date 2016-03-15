class Product < ActiveRecord::Base
  validates_presence_of :title, :price
  validates_numericality_of :price
  default_scope { where(active: true) }
end

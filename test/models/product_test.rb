require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  should validate_presence_of :title
  should validate_presence_of :price
  should validate_numericality_of :price
end

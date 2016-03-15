require 'test_helper'

class Api::V1::ProductsControllerTest < ActionController::TestCase
  setup do
    @product = create(:product)
    assert @product.valid?
  end

  test "should get all products" do
    1.upto(10) do |product|
      create(:product)
    end

    products = Product.order(created_at: :desc)
    assert products.length > 1

    get :index
    assert_response :success
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { active: @product.active, description: @product.description, image: @product.image, price: @product.price, title: @product.title }
    end

    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { active: @product.active, description: @product.description, image: @product.image, price: @product.price, title: @product.title }
    assert_response :success
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product.id
    end
    assert_response :success
  end

  #Testing routes
  test "should route to index" do
    assert_routing( '/api/v1/products', { format: :json, controller: "api/v1/products", action: "index" })
  end

  test "should route to find a product" do
    assert_routing( "/api/v1/products/#{@product.id}", {format: :json, controller: "api/v1/products", action: "show", id: @product.id.to_s} )
  end

  test "should route to update product" do
    assert_routing({ method: 'put', path: "/api/v1/products/#{@product.id}" }, { format: :json, controller: "api/v1/products", action: "update", id: @product.id.to_s })
  end

  test "should route to destroy product" do
    assert_routing({ method: 'delete', path: "/api/v1/products/#{@product.id}" }, { format: :json, controller: "api/v1/products", action: "destroy", id: @product.id.to_s })
  end
end

require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @review = reviews(:one)
    @product = @review.product
  end

  test "should get index" do
    get :index, product_id: @product.id
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get :new, product_id: @product.id
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post :create, product_id: @product.id, review: { body: @review.body, product_id: @review.product_id, title: @review.title }
    end

    assert_redirected_to product_reviews_path(assigns(:product))
  end

  test "should show review" do
    get :show, product_id: @product.id, id: @review
    assert_response :success
  end

  test "should get edit" do
    get :edit, product_id: @product.id, id: @review
    assert_response :success
  end

  test "should update review" do
    patch :update, product_id: @product.id, id: @review, review: { body: @review.body, product_id: @review.product_id, title: @review.title }
    assert_redirected_to product_reviews_path(assigns(:product))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, product_id: @product.id, id: @review
    end

    assert_redirected_to product_reviews_path(@product)
  end
end

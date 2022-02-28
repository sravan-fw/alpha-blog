require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

  setup{
    @admin_user = User.create(username: "johhdoe", email: "johndoe@example.com", 
                              password: "password", admin: true)
    sign_in_as(@admin_user)
  }

  test "get new category form and create category" do
    
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count',1 do
      post categories_path,  category: { name: "Sports"}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end


  test "get new category form and reject create category" do
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path,  category: { name: " "}
    end
    assert_match "error", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end


end


require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  setup{
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Travel")
  }


  test "list categories" do
    get "/categories"

    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end

end

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
    
    def setup
        @chef = Chef.create(chefname: "Bob", email: "bob@example.com")
        @recipe = @chef.recipes.build(name: "Chicken parm", summary: "This is the best chicken parm recipe", description:"Make chicken parm the best possible way")
    end
    
    test "recipe should be valid" do
        assert @recipe.valid?
    end
    
    test "chef_id should be present" do
        @recipe.chef_id=nil
        assert_not @recipe.valid?
    end
    
    test "name should be present" do
        @recipe.name=" "
        assert_not @recipe.valid?
    end
    
    test "name length must not be too long" do
        @recipe.name="a" * 101
        assert_not @recipe.valid?
    end
    
    test "name length should not be too short" do
        @recipe.name="aaaa"
        assert_not @recipe.valid?
    end

    test "summary should be present" do
        @recipe.summary=" "
        assert_not @recipe.valid?
    end
    
    test "summary length should not be too long" do
        @recipe.summary="a" * 151
        assert_not @recipe.valid?
    end

    test "summry length should not be too short" do
        @recipe.summary="aaaa"
        assert_not @recipe.valid?
    end

     test "description should be present" do
        @recipe.description=" "
        assert_not @recipe.valid?
    end
    
    test "description length should not be too long" do
        @recipe.description="a" * 501
        assert_not @recipe.valid?
    end

    test "description length should not be too short" do
        @recipe.description="aaaaaaaaaaaaa"
        assert_not @recipe.valid?
    end
end

require 'spec_helper'

describe ArticlesController do

  context "#index" do
    it "non logged in users can see all articles" do
      get :index
      assert_response :success
      assert_not_nil assigns(:articles)
    end
  end

  context "#show" do
    before do
      @user = create(:admin_user)
      @article = create(:article, user: @user)
    end

    it "non logged in users can see individual articles" do
      get(:show, { id: @article.id } )
      assert_response :success
    end
  end

  context "#new" do
    it "non admin users get redirected to Articles#index" do
      get :new
      assert_redirected_to articles_path
    end

    it "admin users see /new" do
      @admin = create(:admin_user)
      sign_in @admin
      get :new
      assert_response :success
    end
  end

  context "#edit" do
    before do
      @admin = create(:admin_user)
      @article = create(:article, user: @admin)
    end

    it "non admin users get redirected to Articles#index" do
      get( :edit, { id: @article.id} )
      assert_redirected_to articles_path
    end

    it "admin users see edit" do
      sign_in @admin
      get( :edit, { id: @article.id} )
      assert_response :success
    end
  end

end

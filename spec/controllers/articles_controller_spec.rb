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

  context "#create" do
    context "admin user" do
      before do
        @admin = create(:admin_user)
      end

      it "creates a new article" do
        sign_in @admin
        post( :create, { article: { title: "title", content: "content", user_id: @admin.id } } )
        assert_redirected_to article_path(assigns(:article))
      end
    end

    context "admin user" do
      before do
        @user = create(:user)
      end

      it "creates a new article" do
        sign_in @user
        post( :create, { article: { title: "title", content: "content", user_id: @user.id } } )
        assert_redirected_to articles_path
      end
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

  #context "#remove_tag" do
    #before do
      #@admin = create(:admin_user)
      #@article = create(:article, user: @admin)
    #end

    #it "allows admin user to remove tags" do
      #sign_in @admin
      #post( :

    #end
  #end

end

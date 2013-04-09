require 'spec_helper'

describe ArticlesController do

  context "non logged in user" do
    context "GET index" do
      it "can see all articles" do
        get :index
        assert_response :success
        assert_not_nil assigns(:articles)
      end
    end

    context "GET new" do
      it "gets redirected to /index" do
        get :new
        response.should redirect_to articles_path 
      end
    end

    context "GET show" do
      before do
        @article = create :article
      end
      it "can see an individual article" do
        get :show, :id => @article.id
        expect(response.code).to eq "200"
      end
    end

    context "GET new" do 
      it "gets redirected to /index" do
        get :new
        response.should redirect_to articles_path 
      end
    end

    context "GET edit" do
      it "gets redirect to /index" do
        @article = create :article
        get :edit, :id => @article.id
        response.should redirect_to articles_path 
      end
    end

    context "POST create" do
      it "gets rejected by server" do
        post :create, :article => { title: "hello world", content: "amazing", user_id: nil }
        response.should_not be :success
      end
    end

    context "PUT updated" do
      it "gets rejected by the server" do
        @article = create :article
        put :update, :id => @article.id, :article => { title: "new title", content: "new stuff", user_id: nil } 
        response.should_not be :success
      end
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

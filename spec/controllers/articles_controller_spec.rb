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

  context "non-admin logged in user" do
    
    before do
      @user = create :user
      sign_in @user
    end

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


  context "admin logged in user" do
    
    before do
      @admin_user = create :admin_user
      sign_in @admin_user
    end

    context "GET index" do
      it "can see all articles" do
        get :index
        assert_response :success
        assert_not_nil assigns(:articles)
      end
    end

    context "GET new" do
      it "allows user to view new" do
        get :new
        expect(response.code).to eq ("200")
        response.should render_template("new")
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

    context "GET edit" do
      it "allows user to view edit" do
        @article = create :article
        get :edit, :id => @article.id
        expect(response.code).to eq "200"
        response.should render_template("edit")
      end
    end

    context "POST create" do
      it "allows post transaction" do
        expect{
          post :create, :article => { title: "hello world", content: "amazing", user_id: @admin_user.id }
        }.to change(Article, :count).by(1)
        expect(response.code).to eq "302"
        assert_redirected_to article_path(Article.last)
      end
    end

    context "PUT updated" do
      it "allows put transaction" do
        @article = create :article
        put :update, :id => @article.id, :article => { title: "new title", content: "new stuff", user_id: @admin_user.id } 
        @article.reload.content.should == "new stuff"
        expect(response.code).to eq "302"
        assert_redirected_to article_path(Article.last)
      end
    end
  end

end

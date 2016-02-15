require 'test_helper'

describe UsersController do
  before do
    @user = users(:one)
  end

  it "should get index" do
    get :index
    response.should.be.ok
  end

  it "should get new" do
    get :new
    response.should.be.ok
  end

  it "should create user" do
    lambda do
      post :create, params: { user: { name: @user.name } }
    end.should.change('User.count', +1)

    response.should.be.redirect
    response.location.should == user_url(User.last)
  end

  it "should show user" do
    get :show, params: { id: @user.id }
    response.should.be.ok
  end

  it "should get edit" do
    get :edit, params: { id: @user.id }
    response.should.be.ok
  end

  it "should update user" do
    patch :update, params: { id: @user.id, user: { name: @user.name } }

    response.should.be.redirect
    response.location.should == user_url(@user)
  end

  it "should destroy user" do
    lambda do
      delete :destroy, params: { id: @user.id }
    end.should.change('User.count', -1)

    response.should.be.redirect
    response.location.should == users_url
  end
end

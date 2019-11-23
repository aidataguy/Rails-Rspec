require 'rails_helper'
require 'rspec/expectations'


RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) {
      { :name => "John Doe", :email => "joh.doe@email.com"}
  }

  describe "POST #create" do
      it "returns a success response" do
          User.create valid_attributes
          get :index
          expect(response).to be_successful 
      end
  end

  describe "POST create" do

    describe "with valid params" do
      it "creates a new User" do
        user = User.create! valid_attributes

        expect {
          post :create, params: {:user => valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        user = User.create! valid_attributes
        post :create, params: {:user => valid_attributes}
        expect(response).to redirect_to(User.last)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested User" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: {:id => user.id}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the user list" do
      user = User.create! valid_attributes
      delete :destroy, params: {:id => user.id}
      expect(response).to redirect_to('/users')
    end
  end
end
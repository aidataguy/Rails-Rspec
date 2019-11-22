require 'rails_helper'
# require 'support/factory_bot'

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

  describe 'GET #index' do
    it "has users" do
      User.create(name: "John Doe", email: "joh.doe@gmail.com")
      get :index
      expect(name: "John Doe", email: "joh.doe@gmail.com")
  
    end
  end
end
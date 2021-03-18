require "rails_helper"

RSpec.describe ManagementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/managements").to route_to("managements#index")
    end

    it "routes to #new" do
      expect(:get => "/managements/new").to route_to("managements#new")
    end

    it "routes to #show" do
      expect(:get => "/managements/1").to route_to("managements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/managements/1/edit").to route_to("managements#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/managements").to route_to("managements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/managements/1").to route_to("managements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/managements/1").to route_to("managements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/managements/1").to route_to("managements#destroy", :id => "1")
    end
  end
end

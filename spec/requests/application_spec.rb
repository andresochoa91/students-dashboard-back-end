require 'rails_helper'
RSpec.describe ApplicationController, type: :controller do  
    let(:application) { Factory.create(:application) }
    subject { application }
    #context "JSON" do
    context "when not authorized" do
      before do
        json = { :application => { :name => "foo", :description => "bar" } }
        request.env['CONTENT_TYPE'] = 'application/json'
        request.env['RAW_POST_DATA'] = json
        #post :create
      end   
    end
end



#   it "should not allow creation of an application" do
        #     Application.count.should == 0
        #   end 
  
        #   it "should respond with a 403" do
        #     response.status.should eq(403)
        #   end 
  
        #   it "should have a status and message key in the hash" do
        #     JSON.parse(response.body)["status"] == "error"
        #     JSON.parse(response.body)["message"] =~ /authorized/
        #   end 
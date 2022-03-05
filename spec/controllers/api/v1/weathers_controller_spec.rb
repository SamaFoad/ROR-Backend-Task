require 'rails_helper'

RSpec.describe Api::V1::WeathersController, type: :controller do
    # TO DO unit tests Create / GET 
    describe "Gets a Weather with the given id", type: :request do
        context "when weather exists" do
            let(:weather) { FactoryBot.create(:weather) }
      
            it "succeeds" do
              get "/api/v1/weather/#{weather.id.to_s}",
              expect(response).to be_successful
              expect(response).to have_http_status(:ok)
            end
        end

        context "when weather doesn't exists" do
      
            it "fails" do
              get "/api/v1/weather/1000",
              expect(response).not_to be_successful
              expect(response).to have_http_status(404)
            end
        end
    end    
end
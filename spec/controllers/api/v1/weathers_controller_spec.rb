require 'rails_helper'

RSpec.describe Api::V1::WeathersController, type: :controller do
    # TO DO unit test Update 
    describe "Gets All Weather with list", type: :request do
      context "without filters OR sort" do
          let(:weather) { FactoryBot.create(:weather) }
    
          it "succeeds" do
            get "/api/v1/weather"
            expect(response).to be_successful
            expect(response).to have_http_status(:ok)
          end
      end

      context "with sort" do
        it "-date succeeds" do
          get "/api/v1/weather?sort=-date"
          expect(response).to be_successful
          expect(response).to have_http_status(:ok)
        end

        it "date succeeds" do
          get "/api/v1/weather?sort=date"
          expect(response).to be_successful
          expect(response).to have_http_status(:ok)
        end

        it "invalid fails" do
          get "/api/v1/weather?sort=xyz"
          expect(response).not_to be_successful
          expect(response).to have_http_status(400)
        end
      end

      context "with filter" do
        let(:weather) { FactoryBot.create(:weather) }
  
        it "succeeds" do
          get "/api/v1/weather?city=Alexandria"
          expect(response).to be_successful
          expect(response).to have_http_status(:ok)
        end
    end

    describe "Gets a Weather with the given id", type: :request do
        context "when weather exists" do
            let(:weather) { FactoryBot.create(:weather) }
      
            it "succeeds" do
              get "/api/v1/weather/#{weather.id.to_s}"
              expect(response).to be_successful
              expect(response).to have_http_status(:ok)
            end
        end

        context "when weather doesn't exists" do
      
            it "fails" do
              get "/api/v1/weather/100"
              expect(response).not_to be_successful
              expect(response).to have_http_status(404)
            end
        end
    end 

    describe "Creates a new Weather" do
      context "with valid params" do
        it "succeeds" do
          request.headers.merge!({ "CONTENT_TYPE": "application/json" })
          post "/api/v1/weather",
          params: {
            "date": "2022-03-04",
            "lat": 34.1276,
            "lon": -84.472,
            "city": "Alexandria",
            "state": "Egypt",
            "temperatures": [
                14.32,
                9.78,
                10.4,
                11.597
            ], :format => :json
          }
          expect(response).to be_successful
          expect(response).to have_http_status(201)
          expect(Weather.count).to be >=1
        end
      end

      context "with invalid params" do
        it "fails" do
          request.headers.merge!({ "CONTENT_TYPE": "application/json" })
          post "/api/v1/weather",
          params: {
            "city": "Alexandria", :format => :json
          }
          expect(response).to have_http_status(400)
        end
      end 
    end
    
    describe 'Removes the specified Weather with given id', type: :request do
      context 'when exists' do
        let(:weather) { FactoryBot.create(:weather) }
      
          it "succeeds" do
            delete "/api/v1/weather/#{weather.id.to_s}"
           
            expect(response).to be_successful
            expect(response).to have_http_status(:ok)
        end
      end

      context 'when does not exists' do
        it "fails" do
          delete "/api/v1/weather/100"
          
          expect(response).not_to be_successful
          expect(response).to have_http_status(404)
        end
      end
    end

  end
end
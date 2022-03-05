class Api::V1::IpsController < ApplicationController
require "constants.rb"
require 'uri'
require 'net/http'

    def index
        country_code_alpha2 = get_country_code(client_ip) ? get_country_code(client_ip) : nil
        @language = get_preffered_language(request.env['HTTP_ACCEPT_LANGUAGE'])
        res = { 
            ip: client_ip,
            country: country_code_alpha2,
            language: @language
            }
        render json: res, status: 200
    end
    
    private 

    def client_ip
      request.remote_ip
      return "172.217.20.46"
    end
    
    def get_country_code(client_ip)
        uri = URI("https://jsonmock.hackerrank.com/api/ip/#{client_ip}")
        res = Net::HTTP.get_response(uri)
        puts res.body if res.is_a?(Net::HTTPSuccess)
        response_obj = JSON.parse(res.body)
        if response_obj['data']
            country_code = response_obj['data']['country']
            return country_code
        else
            return nil    
        end    
    end

    def get_preffered_language(accept_language)
        langs = accept_language.to_s.split(",").map do |lang| 
                    l, q = lang.split(";q=")
                    [l, (q || '1').to_f]
                end
        langs.sort_by(&:last).map(&:first).reverse
        return langs.any? ? langs[0][0] : nil
    end    
end

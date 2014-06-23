require 'sinatra/base'
require 'json'

class OctoHookNet < Sinatra::Base
	get '/' do
		"<p>This is <i>dynamic</i> content served via unicorn: #{rand(36**6).to_s(36)}"
	end

	post '/log' do
		data = JSON.parse(params[:payload])
		puts "I got some JSON: #{data.inspect}"
	end
end

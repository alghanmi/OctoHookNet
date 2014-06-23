require 'sinatra'
require './octohooknet.rb'

disable :run

map '/ohn' do
	run OctoHookNet
end

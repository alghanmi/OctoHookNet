require 'sinatra/base'
require 'json'
require 'mongo'
require 'pp'

include Mongo


class OctoHookNet < Sinatra::Base
	configure do
		db_connection = MongoClient.new("localhost", 27017)
		set :mongo_connection, db_connection
		set :mongo_db, db_connection.db("octohooknet")
	end


	helpers do
		# a helper method to turn a string ID
		# representation into a BSON::ObjectId
		def object_id val
			BSON::ObjectId.from_string(val)
		end

		def document_by_id id
			id = object_id(id) if String === id
			settings.mongo_db['octohooknet'].find_one(:_id => id).to_json
		end
	end

	get '/' do
		"Good Morning Dave!"
	end

	get '/repos/:repo' do
		content_type :json
		db_coll = settings.mongo_db['octohooknet']
		#db_coll = db_connection.collection('octohooknet')
		#db_cur = db_coll.find('repository.name' => "#{params[:repo]}").to_a
		JSON.pretty_generate( db_coll.find('repository.name' => "#{params[:repo]}").to_a )
	end

	post '/log' do
		data = JSON.parse(request.body.read)
		#pp data
		#data = JSON.parse(params[:payload])
		#puts "I got some JSON: #{data.inspect}"
		content_type :json
		new_id = settings.mongo_db['octohooknet'].insert data
		document_by_id(new_id)
		"ACK #{new_id}"
	end
end

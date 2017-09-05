#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# добавление БД
set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	# параметры которые проверяются, или с ними что-то происходит
	validates :name, presence: true, length: {minimum: 2} # presence => true, пишется как хеш
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :barber, presence: true
	validates :color, presence: true
end

class Barber < ActiveRecord::Base
end

before do 
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get	'/visit' do
	@c = Client.new
	erb :visit
end

post '/visit' do
	@c = Client.new params[:client]
	if @c.save
		erb "Thx man!"
	else
		@error = @c.errors.full_messages.first
		erb :visit
	end
end

get	'/barber/:id' do
	@barber = Barber.find(params[:id])
	erb :barber
end

get '/clients' do
	@client = Client.order('created_at DESC')
	erb :clients
end

get	'/clients/:id' do
	@client = Client.find(params[:id])
	erb :client_page
end
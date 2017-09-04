#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# добавление БД
set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	# параметры которые проверяются, или с ними что-то происходит
	validates :name, presence: true # presence => true, пишется как хеш
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
	erb :visit
end

post '/visit' do
	c = Client.new params[:client]
	c.save

	erb "Thx man!"
end
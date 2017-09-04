#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# добавление БД
set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
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
	@user_name = params[:user_name]
	@user_phone = params[:user_phone]
	@user_time = params[:user_time]
	@barber = params[:barber]
	@color = params[:color]

	c = Client.new
	c.name = @user_name
	c.phone = @user_phone
	c.datestamp = @user_time
	c.barber = @barber
	c.color = @color
	c.save

	erb "Thx man!"
end
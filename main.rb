require 'sinatra'
require './pre-req_checker.rb'
require 'erb'
require 'csv'

before do
  set_title
end

def set_title
  @title = "Pre-req Check"
end

def user_input
  @course = params[:course].to_s
  @result = pre_req_check(@course)
end

get '/' do
  erb :index
end

post '/' do
  user_input
  erb :index
end
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

def test_function
  @test_result = pre_req_checker
end

get '/' do
  test_function
  erb :index
end

post '/' do
  erb :index
end
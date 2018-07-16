require 'sinatra'
require_relative 'random_pair.rb'

enable :sessions

get '/' do
  namelist = session[:names] || []
  namestr = ''
  p namelist
  namelist.each do |v|
    v.each do |nm|
      namestr += nm
      namestr += ' '
    end
    namestr += '<br>'
  end
  erb :name_input, locals:{names: namestr}
end

post '/randomize' do
  session[:names] = random_pair(params['names'])
  p params['names']
  redirect '/'
end
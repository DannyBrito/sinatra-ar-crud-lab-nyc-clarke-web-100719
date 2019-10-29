
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @ins_article = Article.create(params)
    redirect to "/articles/#{@ins_article.id}"
  end

  get '/articles/:id' do
    @ins_article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @ins_article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
   @ins_article = Article.find(params[:id])
   @ins_article.update(title: params[:title], content: params[:content])
    redirect to "/articles/#{@ins_article.id}"
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to '/articles'
  end

end

#Placeholder for a model

class Article < ActiveRecord::Base

    set :views, 'app/views'
    set :method_override, true

  get '/' do
    redirect do "/articles"
  end

  #index
  get '/articles' do
    @articles = Article.all
    #Sets an instance variable to all articles for access
    erb :index
    #shows ALL of the articles one by one
  end

  #new
  get '/articles/new' do
    @article = Article.new
      #creates a new article object
    erb :new
    #renders the page to input a new article
  end

  #create
  post '/articles' do
    @article = Article.create(params)
      #creates a new article based on what was put in
    redirect to "/articles/#{article.id}"
      # redirects to the page of the new article that it just created (based on id)
  end

  #show
  get 'articles/:id' do
    @article = Article.find(params[:id])
    erb :show
    #brings you to an html page that allows you to show the article contents based on the id sbmitted
  end

  #update
  get 'articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
    #brings you to an HTML page where you can edit the page
  end

  delete 'articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end

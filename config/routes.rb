Spina::Engine.routes.draw do
  namespace :admin, path: Spina.config.backend_path do
    # resources :posts, except: [:index, :show]
    resources :posts, except: [:show]
    get '/blog', to: "posts#index", as: "blog"
  end
  scope 'blog' do
    get '/', to: "posts#index", as: "blog_root"
    # TODO: Add archive paths for year/month/day
    # get '/:year(/:month(/:day))', to: "posts#index", as: "blog_archive"
    # get '/:year/:month/:day/:id', to: "posts#show", as: "blog_post"
    # Use materialized path for blog path definitions instead.
    get '/preview/*id', to: "posts#preview", as: "blog_post_preview"
    get '/*id', to: "posts#show", as: "blog_post"
  end
end

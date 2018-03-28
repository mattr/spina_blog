Spina::Engine.routes.draw do
  namespace :admin, path: Spina.config.backend_path do
    resources :posts, except: [:show]
    get '/blog', to: "posts#index", as: "blog"
  end
  scope 'blog' do
    get '/', to: "posts#index", as: "blog_root"
    get '/:year(/:month(/:day))', to: "posts#index", as: "blog_archive"
    get '/:year/:month/:day/:id', to: "posts#show", as: "blog_post"
  end
end

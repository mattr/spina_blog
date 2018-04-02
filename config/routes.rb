require 'spina_blog/blog'
# NAMESPACES = SpinaBlog::Blog.all.map(&:namespace)
Spina::Engine.routes.draw do
  namespace :admin, path: Spina.config.backend_path do
    resources :posts, except: [:show]
  end
  if SpinaBlog::Blog.namespaces.any?
    get '/:namespace', to: "posts#index", as: "blog_root", constraints: { namespace: /#{SpinaBlog::Blog.namespaces.join('|')}/ }
    get '/:namespace/*id', to: "posts#show", as: "blog_post", constraints: { namespace: /#{SpinaBlog::Blog.namespaces.join('|')}/ }
  end
end

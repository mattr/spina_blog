require 'spina_blog/blog'
NAMESPACES = SpinaBlog::Blog.all.map(&:namespace)
Spina::Engine.routes.draw do
  namespace :admin, path: Spina.config.backend_path do
    resources :blogs, except: [:show] do
      resources :posts, except: [:show]
    end
  end
  if NAMESPACES.any?
    get '/:namespace', to: "posts#index", as: "blog_root", constraints: { namespace: /#{NAMESPACES.join('|')}/ }
    get '/:namespace/*id', to: "posts#show", as: "blog_post", constraints: { namespace: /#{NAMESPACES.join('|')}/ }
  end
end

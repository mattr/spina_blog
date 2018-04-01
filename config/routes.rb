require 'spina_blog/blog'
NAMESPACES = /#{SpinaBlog::Blog.all.map(&:namespace).join('|')}/
Spina::Engine.routes.draw do
  namespace :admin, path: Spina.config.backend_path do
    resources :blogs, except: [:show] do
      resources :posts, except: [:show]
    end
  end

  get '/:namespace', to: "posts#index", as: "blog_root", constraints: { namespace: NAMESPACES }
  get '/:namespace/*id', to: "posts#show", as: "blog_post", constraints: { namespace: NAMESPACES }
end

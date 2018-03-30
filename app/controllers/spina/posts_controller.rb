module Spina
  class PostsController < ApplicationController
    def index
      @posts = Post.published
    end

    def show
      @post = Post.published.find_by(materialized_path: params[:id])
      # @post = Post.find(params[:id])
    end

    def preview
      @post = Post.find_by(materialized_path: params[:id])
      render action: 'show'
    end
  end
end

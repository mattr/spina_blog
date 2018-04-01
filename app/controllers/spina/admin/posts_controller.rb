module Spina
  module Admin
    class PostsController < AdminController
      before_action :set_breadcrumb
      before_action :set_post, only: [:edit, :update, :destroy]

      layout 'spina/admin/admin'

      def index
        @posts = Post.group_by(:namespace).all
      end

      def new
        @post = Post.new
      end

      def edit
      end

      def create
        @post = Post.new(post_params)
        @post.author = current_spina_user
        if @post.save
          redirect_to admin_blog_path, notice: 'Post was successfully created.'
        else
          render :new
        end
      end

      def update
        if @post.update(post_params)
          redirect_to admin_blog_path, notice: 'Post was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @post.destroy
        redirect_to admin_blog_path, notice: 'Post was successfully destroyed.'
      end

      private

      def post_params
        params.require(:post).permit(:title, :body, :tag_list, :publish_date, :publish_time, :is_draft)
      end

      def set_breadcrumb
        add_breadcrumb 'Posts', admin_posts_path
      end

      def set_post
        @post = Post.find(params[:id])
        add_breadcrumb @post.title
      end
    end
  end
end
# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def main
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user.email
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by id: params[:id]
  end

  def update
    @post = Post.find_by id: params[:id]
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :artist, :album, :members, :cost, :shipping_cost, :shipping_options, :notes)
  end
end

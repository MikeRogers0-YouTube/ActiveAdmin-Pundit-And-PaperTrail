class Posts::PublishFormsController < ApplicationController
  before_action :set_post

  def new
    @publish_form = authorize Post::PublishForm.new(post: @post)
  end

  def create
    @publish_form = authorize Post::PublishForm.new(post: @post)
    @publish_form.attributes = publish_form_params

    if @publish_form.save
      redirect_to @publish_form.post, notice: "Post was successfully Published."
    else
      render :new
    end
  end

  private

  def publish_form_params
    params.require(:post_publish_form).permit(:terms_of_service)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

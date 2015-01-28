class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.micropost_id = params[:micropost_id]
    if @comment.save
      flash[:success] = "Comment created!"
    else
      @comments = []
    end
    redirect_to Micropost.find(params[:micropost_id])
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
    
end
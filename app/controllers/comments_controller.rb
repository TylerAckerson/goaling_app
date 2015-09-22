class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    #@comment.commentable_type =
    #@comment.commentable_id =

    if @comment.save
      redirect_to "/#{@comment.commentable_type}s/#{@comment.commentable_id}"
    else
      flash.now[:errors] = @comment.errors.full_messages
      # ???
    end
  end

  def destroy
  end
end

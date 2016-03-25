class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params(params))
    parent_id = params[:comment][:parent_id]

    if @comment.save
      Relationship.create(child_id: @comment.id, parent_id: parent_id)

      respond_to do |format|
        format.html
        format.js
      end
    else
      redirect_to root_path
    end

  end

  def show
  end

  def destroy
    @comment = current_user.comments.find_by_id(params[:id]).destroy

    respond_to do |format|
      format.html
      format.js
    end

  end
  
  private
    def comment_params(params)
      params.require(:comment).permit(:content, :post_id)
    end
end

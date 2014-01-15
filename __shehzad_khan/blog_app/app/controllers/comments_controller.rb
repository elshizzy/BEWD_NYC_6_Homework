class CommentsController < ApplicationController
before_action :set_comment, only: [:show, :edit, :update, :destroy]

def index
	@comments = Comment.all
end

def show
end

def edit
end

def create
	@post = Post.find(params[:post_id])
	@comment = Comment.new(comment_params)
	@post.comments << @comment
	if @post.save
		redirect_to @post, notice: 'Comment was successfully created.'
	else
		render action: 'new'
	end
end

def destroy
	@comment = Comment.find(params[:id])
	@comment.destroy
	respond_to do |format|
		format.html {redirect_to comments_url}
	end
end

private

def set_comment
	@comment = Comment.find(params[:id])
end

def comment_params
	params.require(:comment).permit(:content, :email)
end

end

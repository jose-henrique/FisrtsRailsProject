class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        if logged_in?
            @comment = @article.comments.create(commenter: current_user.name, body: params[:comment][:body], status: params[:comment][:status])
            redirect_to article_path(@article)
        end

    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article), status: 300
    end

    private
        def comment_params
            params.require(:comment).permit(:body, :status)
        end

end

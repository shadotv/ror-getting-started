class CommentsController < ApplicationController

    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

    def new 
    end

    def create
        #devo creare un commento per un determinato articolo utilizzando il campo relationship
        #prendo l'articolo associato
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        #dato che l'helper article_path ha come argomento la reference all'articolo, viene inferito che deve essere renderizzata la view comments/show
        redirect_to article_path(@article)
    end

    def edit
    end

    def update
    end

    def destroy
        
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
       
        redirect_to article_path(@article)
    end
    
    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end

end

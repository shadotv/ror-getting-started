# un controller è una classe che estende ApplicationController
# dentro questa classe verranno definiti metodi che rappresenteranno le actions 
# solo metodi pubblici possono diventare actions per il controller


class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    def index
        @articles = Article.all        
    end

    def show        
        @article = Article.find(params[:id])
    end
    
    # definisco il controller per new     
    def new
        #serve creare una nuova istanza, perchè altrimenti la prima volta che viene renderizzato 
        #il form per creare un nuovo articolo, la funzione all'interno del form che vede se ci sono 
        # errori nella creazione verrà eseguita su nil 
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create                
        # renderizzo tutti i parametri del form
        #render plain: params[:article].inspect

        #salvo i dati nel database
        #la varibile article mantiene la reference all'oggetto
        @article = Article.new(article_params)
        
        #controllo che il salvataggio sia andato a buon fine
        if @article.save
             # Inferisce in automatico il path della route articles/:id metodo GET
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
       if @article.update(article_params)            
            redirect_to @article
        else 
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
       
        redirect_to articles_path
    end

    private 
        def article_params
            params.require(:article).permit(:title, :text)

        end
 
 
end

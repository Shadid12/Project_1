class ProjectsController < ApplicationController
    before_action :find_book, only: [:show, :edit, :update, :destroy]
    
    def index
        @stuff = Project.all.order("created_at DESC")
    end
    
    def show
        
    end
    
    def edit
        
    end
    
    def update
        
        if @stuff.update(stuff_params)
			redirect_to project_path(@stuff)
		else
			render 'edit'
	end
    end
    
    def new
        @stuff = Project.new
    end
    
    def destroy
        @stuff.destroy
        redirect_to root_path
    end
    
    def create
        @stuff = Project.new(stuff_params)
        
        if @stuff.save
			redirect_to root_path
		else
			render 'new'
	end
    
    end
    
    private
    
    def stuff_params
        params.require(:project).permit(:title, :description, :author)
    end
    
        def find_book
			@stuff = Project.find(params[:id])
	end
end

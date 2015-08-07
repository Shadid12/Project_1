class ProjectsController < ApplicationController
    
    before_action :find_book, only: [:show, :edit, :update, :destroy]
    before_filter :require_permission, only: [:edit, :update, :destroy] 
    before_action :authenticate_user!, except: [:index, :show]
    
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
        @stuff = current_user.projects.build
    end
    
    def destroy
        @stuff.destroy
        redirect_to root_path
    end
    
    def create
        @stuff = current_user.projects.build(stuff_params)
        
        if @stuff.save
			redirect_to root_path
		else
			render 'new'
	end
    
    end
    
    private
    
    
    def require_permission
        if current_user != Project.find(params[:id]).user
            redirect_to root_path
        end
    end
    
    def stuff_params
        params.require(:project).permit(:title, :description, :author)
    end
    
        def find_book
			@stuff = Project.find(params[:id])
	end
end

class ProjectsController < ApplicationController
    def index
        @p = Project.all
    end


    def show
        @p = Project.find(params[:id])
    end

    def new 
        @p = Project.new
    end 


    def create
        @p = Project.new(project_params)
        @p.creator_id = current_user.id
        if @p.save
            flash[:success] = "project save successfully"
            redirect_to projects_path
    
        else 
            render 'new'
        end  
    end 


    def edit  
        @p = Project.find(params[id])
    end 

    def update 
    end


    private
 
    def project_params
        params.require(:project).permit(:projectname, :description, :creator_id, :assignee_id)
        
    end

end
class BugsController < ApplicationController
    def index
        @b = Bug.all
    end


    def show
        @b = Bug.find(params[:id])
    end

    def new 
        @b = Bug.new
    end 


    def create
        @b = Bug.new(project_params)
        @b.project_creator = User.last
        if @p.save
            flash[:success] = "project save successfully"
            redirect_to project_path(@p)
    
        else 
            render 'new'
        end  
    end 


    private
 
    def project_params
        params.require(:project).permit(:projectname, :description, :creator_id, :assignee_id)
        redirect_to projects_path
    end
end
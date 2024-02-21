class ChecklistsController < ApplicationController
    before_action :set_checklist, only: [:show, :update, :destroy]
  
    # GET /jobs/:job_id/checklists/:id
    def show
      render json: @checklist
    end
  
    # POST /jobs/:job_id/checklists
    def create
      @job = current_user.jobs.find(params[:job_id])
      @checklist = @job.build_checklist(checklist_params)
  
      if @checklist.save
        render json: @checklist, status: :created, location: @job
      else
        render json: @checklist.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /checklists/:id
    def update
      if @checklist.update(checklist_params)
        render json: @checklist
      else
        render json: @checklist.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /checklists/:id
    def destroy
      @checklist.destroy
      head :no_content
    end
  
    private
  
    def set_checklist
      @checklist = current_user.jobs.find(params[:job_id]).checklist
    end
  
    def checklist_params
      params.require(:checklist).permit(:title)
    end
  end
  

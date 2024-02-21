class ChecklistItemsController < ApplicationController
    before_action :set_checklist_item, only: [:update, :destroy]
  
    # GET /jobs/:job_id/checklists/:checklist_id/checklist_items
    def index
      @checklist_items = current_user.jobs.find(params[:job_id]).checklist.checklist_items
      render json: @checklist_items
    end
  
    # POST /jobs/:job_id/checklists/:checklist_id/checklist_items
    def create
      @checklist_item = current_user.jobs.find(params[:job_id]).checklist.checklist_items.build(checklist_item_params)
  
      if @checklist_item.save
        render json: @checklist_item, status: :created
      else
        render json: @checklist_item.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /checklist_items/:id
    def update
      if @checklist_item.update(checklist_item_params)
        render json: @checklist_item
      else
        render json: @checklist_item.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /checklist_items/:id
    def destroy
      @checklist_item.destroy
      head :no_content
    end
  
    private
  
    def set_checklist_item
      @checklist_item = current_user.jobs.find(params[:job_id]).checklist.checklist_items.find(params[:id])
    end
  
    def checklist_item_params
      params.require(:checklist_item).permit(:description)
    end
  end
  

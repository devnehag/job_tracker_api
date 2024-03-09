class JobsController < ApplicationController
    before_action :set_job, only: [:show, :update, :destroy]
    # GET /jobs
    def index
      @jobs = current_user.jobs # Assuming you have a current_user method for authentication
      render json: @jobs
    end
    # GET /jobs/:id
    def show
      render json: @job
    end
    # POST /jobs
    def create
      @job = current_user.jobs.build(job_params)
      if @job.save
        render json: @job, status: :created, location: @job
      else
        render json: @job.errors, status: :unprocessable_entity
      end
    end 
    # PUT /jobs/:id
    def update
      if @job.update(job_params)
        render json: @job
      else
        render json: @job.errors, status: :unprocessable_entity
      end
    end 
    # DELETE /jobs/:id
    def destroy
      @job.destroy
      head :no_content
    end 
    private 
    def set_job
      @job = current_user.jobs.find(params[:id])
    end 
    def job_params
      params.require(:job).permit(:name, :company, :status)
    end
  end
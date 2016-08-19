class JobsController < ApplicationController
	def index
		@company = Company.find(params[:company_id])
		@job = @company.jobs.all
	end

	def show
		
		@company = Company.find(params[:company_id])
	    @job = @company.jobs.find(job_params)
	end

	def new
	end

	def create
	  @company = Company.find(params[:company_id])
	  @job = @company.jobs.create(job_params)

	  
	  redirect_to company_path(@company)
	end

	private
		def job_params
			params.require(:job).permit(:profession, :country, :city)
		end
end

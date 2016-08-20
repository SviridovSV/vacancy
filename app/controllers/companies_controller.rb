class CompaniesController < ApplicationController
  def index
  	@company = Company.paginate(page: params[:page], per_page: 5) 
    
    if params[:search]
      @companies = Company.search(params[:search]).order("created_at DESC")
    else
      @companies = Company.all.order('created_at DESC')
    end
  end

  def show
  	@company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
  	@company = Company.new(company_params)

  	if @company.save
  	  redirect_to @company
    else
      render 'new'
    end
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to @company
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    redirect_to companies_path
  end
  

  private
  	def company_params
  	  params.require(:company).permit(:title)
  	end
end

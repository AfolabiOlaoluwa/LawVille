class LawyersController < ApplicationController

  layout 'application_index_page', :only => :index

  #before_action :get_lawyer, only: [:show, :edit, :preview, :destroy]
  before_action :get_lawyer, only: [:show]

  def index
    @lawyer = Lawyer.all
  end


  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json.pretty_print {render json: @lawyer }
      format.xml {render xml: @lawyer }
    end
  end

=begin
  def new
    @lawyer = Lawyer.new
  end


  def edit
    redirect_to @lawyer if @lawyer.its_published?
  end


  def create
    @lawyer = Lawyer.new(law_params)
    if @lawyer.save
      redirect_to preview_lawyer_path(@lawyer)
    else
      render :new
    end
  end


  def update
    #@lawyer = Lawyer.find_by_token(params[:token])
    @lawyer = Lawyer.find_by_token(params[:id])
    if @lawyer.update law_params
      if @lawyer.published?
        redirect_to @lawyer, notice: 'Lawyer successfully posted !'
      else
        redirect_to preview_lawyer_path
      end
    else
      render action: 'new'
    end
  end

=begin
  def destroy
    @lawyer.destroy
     redirect_to lawyers_url
  end


  def preview
    redirect_to @lawyer if @lawyer.its_published?
  end
=end

  def publish
  end

  private

  def get_lawyer
    @lawyer = Lawyer.find_by_token(params[:id])
  end


  def law_params
    params.require(:lawyer).permit(:name, :category_id,
                                   :image, :title, :category_id,
                                   :phone_number, :website, :email,
                                   :twitter_link, :linkedin_link,
                                   :professional_details, :published,
                                   :token, :remove_image )
  end

end
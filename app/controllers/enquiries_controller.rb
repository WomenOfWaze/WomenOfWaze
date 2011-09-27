class EnquiriesController < ApplicationController

  def index
    @enquiry = Enquiry.new
    @firstname_params = params[:firstname]
    @lastname_params = params[:lastname]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @enquiry }
    end
  end

  def show
    @enquiry = Enquiry.find(params[:id  ])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @enquiry }
    end
  end
  def create
    @enquiry = Enquiry.new(params[:enquiry])

    respond_to do |format|
      if @enquiry.save
        format.html { render :text => "<font size='+4' color='green'>Thank you for queries.</font>" }
      else
        format.html { render :action => "new" }
        format.json { render :json => @enquiry.errors, :status => :unprocessable_entity }
      end
    end
  end

end

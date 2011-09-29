class EnquiriesController < ApplicationController
  respond_to :html, :js, :xml

  def index
    @enquiries = Enquiry.all
    respond_with(@enquiries)
  end

  def edit
    @enquiry = Enquiry.find(params[:id])
  end
  def new
    @enquiry = Enquiry.new
    @firstname_params = params[:firstname]
    @lastname_params = params[:lastname]
    respond_with(@enquiry)
  end

  def show
    @enquiry = Enquiry.find(params[:id  ])
    respond_with(@enquiry)
  end
  def create
    @enquiry = Enquiry.new(params[:enquiry])
    respond_to do |format|
      if @enquiry.save
        format.js      
      else
        respond_with(@enquiry)
      end
    end
  end

  def update
    @enquiry = Enquiry.find(params[:id])

    respond_to do |format|
      if @enquiry.update_attributes(params[:enquiry])
        flash[:notice] = 'Enquiry was successfully updated.'
      else
        format.html { render :action => "edit" }
        respond_with(@enquiry)
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @enquiry = Enquiry.find(params[:id])
    @enquiry.destroy
    respond_with(@enquiry)
  end


end

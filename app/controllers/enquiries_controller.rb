class EnquiriesController < ApplicationController

  def index
    @enquiries = Enquiry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end


  def new
    @enquiry = Enquiry.new
    @firstname_params = params[:firstname]
    @lastname_params = params[:lastname]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @enquiry }
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
       format.js { render :js => "alert('Thank you for queries.We will soon get back to you by mail!');window.location.replace('#{catalogue_products_url}');" }
      else
        format.html { render :action => "new" }
        format.json { render :json => @enquiry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @enquiry = Enquiry.find(params[:id])

    respond_to do |format|
      if @enquiry.update_attributes(params[:enquiry])
        format.html { redirect_to(@enquiry, :notice => 'Enquiry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @enquiry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @enquiry = Enquiry.find(params[:id])
    @enquiry.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml  { head :ok }
    end
  end

end

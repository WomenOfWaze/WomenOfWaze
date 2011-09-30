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
    if params[:product_id]
      @product = Product.find(params[:product_id])
      if @product
        @enquiry.remarks = "I am interested in buying Product #{@product.name} with Code #{@product.code}"
      end
    end
    
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
        EnquiryMailer.enquiry_mail(@enquiry).deliver
        format.html { redirect_to(catalogue_products_path, :notice => "Thank you for inquiries. We shall get in touch with you soon.") }
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

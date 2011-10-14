class ProductsController < ApplicationController
  
  skip_before_filter :authenticate_user!, :only => [:catalogue,:detail]
  # GET /products
  # GET /products.xml
  def index

    @sub_category = SubCategory.find_by_id(params[:sub_category_id]) if params[:sub_category_id]
    @category = Category.find_by_id(@sub_category.category_id) if @sub_category
    @products = @sub_category.products

    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @sub_category = SubCategory.find_by_id(params[:sub_category_id]) if params[:sub_category_id]
    @product = Product.new(:sub_category_id => params[:sub_category_id]) if @sub_category
        
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @sub_category = SubCategory.find_by_id(params[:sub_category_id]) if params[:sub_category_id]
    @product = Product.new(params[:product].merge(:sub_category_id => params[:sub_category_id])) if @sub_category
    #To be moved to the model, the below line of code
    @product.code = Product.generate_code(@product.id) if @product and @product.save
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
#      format.html { redirect_to products_path(:sub_category_id => @product.sub_category_id) }
      format.html { redirect_to products_url(:sub_category_id => @product.sub_category_id) }
      format.xml  { head :ok }
    end
  end

  def catalogue
    @categories = Category.catalogue_details    
  end

  def detail
    @product = Product.find(params[:id])
    render :partial => 'detail'
  end
end

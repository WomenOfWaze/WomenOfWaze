class SubCategoriesController < ApplicationController
  # GET /sub_categories
  # GET /sub_categories.xml
  def index
    @category = Category.find_by_id(params[:category_id]) if params[:category_id]
    @sub_categories = @category.sub_categories if @category
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sub_categories }
    end
  end

  # GET /sub_categories/1
  # GET /sub_categories/1.xml
  def show
    #    @category = Category.find(params[:id])
    @sub_category = SubCategory.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sub_category }
    end
  end

  # GET /sub_categories/new
  # GET /sub_categories/new.xml
  def new
    @category = Category.find_by_id(params[:category_id]) if params[:category_id]
    @sub_category = SubCategory.new(:category_id => params[:category_id]) if @category
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sub_category }
    end
  end

  # GET /sub_categories/1/edit
  def edit
    @sub_category = SubCategory.find(params[:id])
  end

  # POST /sub_categories
  # POST /sub_categories.xml
  def create
    @category = Category.find_by_id(params[:category_id]) if params[:category_id]
    @sub_category = SubCategory.new(params[:sub_category].merge(:category_id => params[:category_id])) if @category
   
    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to(@sub_category, :notice => 'Sub category was successfully created.') }
        format.xml  { render :xml => @sub_category, :status => :created, :location => @sub_category }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @sub_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sub_categories/1
  # PUT /sub_categories/1.xml
  def update
    @sub_category = SubCategory.find(params[:id])

    respond_to do |format|
      if @sub_category.update_attributes(params[:sub_category])
        format.html { redirect_to(@sub_category, :notice => 'Sub category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sub_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_categories/1
  # DELETE /sub_categories/1.xml
  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy

    respond_to do |format|
      format.html { redirect_to sub_categories_path(:category_id => @sub_category.category_id) }
      format.xml  { head :ok }
    end
  end

 end

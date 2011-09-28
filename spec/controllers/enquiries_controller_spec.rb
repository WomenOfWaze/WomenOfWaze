require 'spec_helper'


describe EnquiriesController do

  def valid_attributes
    @enquiry = Factory :enquiries
  end

  describe "GET index" do
    it "assigns all Enquiries as @enquiries" do
      enquiries = Enquiry.create! valid_attributes
      get :index
      assigns(:enquiries).should eq([enquiries])
    end
  end

  describe "GET show" do
    it "assigns the requested Enquiry as @enquiry" do
      enquiry = Enquiry.create! valid_attributes
      get :show, :id => enquiry.id.to_s
      assigns(:enquiry).should eq(enquiry)
    end
  end

  describe "GET new" do
    it "assigns a new enquiry as @enquiry" do
      get :new
      assigns(:enquiry).should be_a_new(enquiry)
    end
  end

  describe "GET edit" do
    it "assigns the requested enquiry as @enquiry" do
      enquiry = Enquiry.create! valid_attributes
      get :edit, :id => Enquiry.id.to_s
      assigns(:enquiry).should eq(enquiry)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Enquiry" do
        expect {
          post :create, :enquiry => valid_attributes
        }.to change(enquiry, :count).by(1)
      end

      it "assigns a newly created Enquiry as @Enquiry" do
        post :create, :enquiry => valid_attributes
        assigns(:enquiry).should be_a(:enquiry)
        assigns(:enquiry).should be_persisted
      end

      it "redirects to the created Enquiry" do
        post :create, :enquiry => valid_attributes
        response.should == "<font size='+4' color='green'>Thank you for queries.</font>"#redirect_to(enquiry.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved Enquiry as @enquiry" do
        # Trigger the behavior that occurs when invalid params are submitted
        enquiry.any_instance.stub(:save).and_return(false)
        post :create, :enquiry => {}
        assigns(:enquiry).should be_a_new(enquiry)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        enquiry.any_instance.stub(:save).and_return(false)
        post :create, :Enquiry => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do


    describe "with invalid params" do
      it "assigns the Enquiry as @Enquiry" do
        enquiry = Enquiry.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Enquiry.any_instance.stub(:save).and_return(false)
        put :update, :id => enquiry.id.to_s, :enquiry => {}
        assigns(:enquiry).should eq(enquiry)
      end

      it "re-renders the 'edit' template" do
        enquiry = Enquiry.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Enquiry.any_instance.stub(:save).and_return(false)
        put :update, :id => enquiry.id.to_s, :enquiry => {}
        response.should render_template("edit")
      end
    end
  end



end

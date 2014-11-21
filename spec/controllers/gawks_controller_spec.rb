require 'rails_helper'

RSpec.describe GawksController, :type => :controller do

  let(:valid_attributes) {
    { error_class: "IAmAnError", message: "I love ruining code" }
  }

  describe "GET show" do
    it "assigns the requested gawk as @gawk" do
      gawk = Gawk.create! valid_attributes
      get :show, {:id => gawk.to_param}
      expect(assigns(:gawk)).to eq(gawk)
    end
  end


  describe "POST create" do
    describe "with valid params" do
      it "creates a new Gawk" do
        expect {
          post :create, {:gawk => valid_attributes}
        }.to change(Gawk, :count).by(1)
      end

      it "assigns a newly created gawk as @gawk" do
        post :create, {:gawk => valid_attributes}
        expect(assigns(:gawk)).to be_a(Gawk)
        expect(assigns(:gawk)).to be_persisted
      end

      it "redirects to the created gawk" do
        post :create, {:gawk => valid_attributes}
        expect(response).to redirect_to(Gawk.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved gawk as @gawk" do
        post :create, {:gawk => invalid_attributes}
        expect(assigns(:gawk)).to be_a_new(Gawk)
      end

    end
  end



end

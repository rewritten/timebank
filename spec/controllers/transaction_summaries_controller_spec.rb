require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TransactionSummariesController do

  # This should return the minimal set of attributes required to create a valid
  # TransactionSummary. As you add validations to TransactionSummary, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all transaction_summaries as @transaction_summaries" do
      transaction_summary = TransactionSummary.create! valid_attributes
      get :index
      assigns(:transaction_summaries).should eq([transaction_summary])
    end
  end

  describe "GET show" do
    it "assigns the requested transaction_summary as @transaction_summary" do
      transaction_summary = TransactionSummary.create! valid_attributes
      get :show, :id => transaction_summary.id.to_s
      assigns(:transaction_summary).should eq(transaction_summary)
    end
  end

  describe "GET new" do
    it "assigns a new transaction_summary as @transaction_summary" do
      get :new
      assigns(:transaction_summary).should be_a_new(TransactionSummary)
    end
  end

  describe "GET edit" do
    it "assigns the requested transaction_summary as @transaction_summary" do
      transaction_summary = TransactionSummary.create! valid_attributes
      get :edit, :id => transaction_summary.id.to_s
      assigns(:transaction_summary).should eq(transaction_summary)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TransactionSummary" do
        expect {
          post :create, :transaction_summary => valid_attributes
        }.to change(TransactionSummary, :count).by(1)
      end

      it "assigns a newly created transaction_summary as @transaction_summary" do
        post :create, :transaction_summary => valid_attributes
        assigns(:transaction_summary).should be_a(TransactionSummary)
        assigns(:transaction_summary).should be_persisted
      end

      it "redirects to the created transaction_summary" do
        post :create, :transaction_summary => valid_attributes
        response.should redirect_to(TransactionSummary.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved transaction_summary as @transaction_summary" do
        # Trigger the behavior that occurs when invalid params are submitted
        TransactionSummary.any_instance.stub(:save).and_return(false)
        post :create, :transaction_summary => {}
        assigns(:transaction_summary).should be_a_new(TransactionSummary)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TransactionSummary.any_instance.stub(:save).and_return(false)
        post :create, :transaction_summary => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested transaction_summary" do
        transaction_summary = TransactionSummary.create! valid_attributes
        # Assuming there are no other transaction_summaries in the database, this
        # specifies that the TransactionSummary created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TransactionSummary.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => transaction_summary.id, :transaction_summary => {'these' => 'params'}
      end

      it "assigns the requested transaction_summary as @transaction_summary" do
        transaction_summary = TransactionSummary.create! valid_attributes
        put :update, :id => transaction_summary.id, :transaction_summary => valid_attributes
        assigns(:transaction_summary).should eq(transaction_summary)
      end

      it "redirects to the transaction_summary" do
        transaction_summary = TransactionSummary.create! valid_attributes
        put :update, :id => transaction_summary.id, :transaction_summary => valid_attributes
        response.should redirect_to(transaction_summary)
      end
    end

    describe "with invalid params" do
      it "assigns the transaction_summary as @transaction_summary" do
        transaction_summary = TransactionSummary.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TransactionSummary.any_instance.stub(:save).and_return(false)
        put :update, :id => transaction_summary.id.to_s, :transaction_summary => {}
        assigns(:transaction_summary).should eq(transaction_summary)
      end

      it "re-renders the 'edit' template" do
        transaction_summary = TransactionSummary.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TransactionSummary.any_instance.stub(:save).and_return(false)
        put :update, :id => transaction_summary.id.to_s, :transaction_summary => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested transaction_summary" do
      transaction_summary = TransactionSummary.create! valid_attributes
      expect {
        delete :destroy, :id => transaction_summary.id.to_s
      }.to change(TransactionSummary, :count).by(-1)
    end

    it "redirects to the transaction_summaries list" do
      transaction_summary = TransactionSummary.create! valid_attributes
      delete :destroy, :id => transaction_summary.id.to_s
      response.should redirect_to(transaction_summaries_url)
    end
  end

end

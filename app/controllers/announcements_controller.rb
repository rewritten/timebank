class AnnouncementsController < ApplicationController
  # GET /account_statuses
  # GET /account_statuses.xml
  def index
    @offers = Announcement.offers
    @requests = Announcement.requests
    # @account_statuses = AccountStatus.all
    # 
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml  { render :xml => @account_statuses }
    # end
  end

  # # GET /account_statuses/1
  # # GET /account_statuses/1.xml
  # def show
  #   @account_status = AccountStatus.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @account_status }
  #   end
  # end
  # 
  # # GET /account_statuses/new
  # # GET /account_statuses/new.xml
  # def new
  #   @account_status = AccountStatus.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.xml  { render :xml => @account_status }
  #   end
  # end
  # 
  # # GET /account_statuses/1/edit
  # def edit
  #   @account_status = AccountStatus.find(params[:id])
  # end
  # 
  # # POST /account_statuses
  # # POST /account_statuses.xml
  # def create
  #   @account_status = AccountStatus.new(params[:account_status])
  # 
  #   respond_to do |format|
  #     if @account_status.save
  #       format.html { redirect_to(@account_status, :notice => 'Account status was successfully created.') }
  #       format.xml  { render :xml => @account_status, :status => :created, :location => @account_status }
  #     else
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @account_status.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # PUT /account_statuses/1
  # # PUT /account_statuses/1.xml
  # def update
  #   @account_status = AccountStatus.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @account_status.update_attributes(params[:account_status])
  #       format.html { redirect_to(@account_status, :notice => 'Account status was successfully updated.') }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @account_status.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # DELETE /account_statuses/1
  # # DELETE /account_statuses/1.xml
  # def destroy
  #   @account_status = AccountStatus.find(params[:id])
  #   @account_status.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(account_statuses_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end

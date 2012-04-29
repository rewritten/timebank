class TransactionsController < ApplicationController

  load_and_authorize_resource

  def index

  end

  def show

  end

  def edit
  end

  def create
    puts "============== #{params.inspect} ===="
    @transaction = Transaction.new(params[:transaction])
    puts @transaction
    if params[:announcement_id]
      @transaction.announcement = Announcement.find(params[:announcement_id])
      account = @transaction.announcement.user.account
      if @transaction.announcement.offer?
        @transaction.destination ||= account
        @transaction.source ||= current_user.account
        @transaction.confirmed ||= true
      else
        @transaction.source ||= account
        @transaction.destination ||= current_user.account
        @transaction.confirmed ||= false
      end
    end
    unless can? :manage, Transaction
      if @transaction.destination.user_id == current_user.id
        @transaction.confirmed = false
      elsif
        @transaction.source.user_id == current_user.id
      end
    end
    @transaction.save
    redirect_to current_user.account, notice: 'Transaction created.'
  end
  
  def create_from_announcement
    
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to(@account, :notice => 'Account was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end
end

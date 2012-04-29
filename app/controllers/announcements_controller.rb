class AnnouncementsController < ApplicationController

  load_and_authorize_resource

  before_filter :ensure_current_user, only: [:create, :update]

  def ensure_current_user
    params[:announcement][:user_id] = current_user.id unless can? :manage, Announcement
  end

  def index
    @announcements = @announcements.includes(:user)
    @announcements = @announcements.tagged_with(params[:tag]) if params[:tag].present?
    @announcements = @announcements.send params[:type].to_sym if params[:type].present?
    @announcements = @announcements.with_words *params[:q].split if params[:q].present? 
    @announcements = @announcements.where user_id: current_user.id unless params[:mine].blank? or not current_user
    unless params[:with_me].blank? or not current_user
      conversing_with_me = Conversation.where(interlocutor_id: current_user.id).only(:announcement_id).collect(&:announcement_id).uniq
      @announcements = @announcements.any_in id: conversing_with_me
    end

    @tags = Announcement.tags
    if request.xhr?
      render partial: "announcement_row", layout: false, collection: @announcements
    end
  end

  def show
  end

  def new
    @announcement = Announcement.new
  end

  def edit
  end

  def create
    @announcement = Announcement.new(params[:announcement])
    if @announcement.save
      redirect_to(@announcement, :notice => 'Announcement was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @announcement.update_attributes(params[:announcement])
      redirect_to(@announcement, :notice => 'Announcement was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @announcement.destroy
    redirect_to(announcements_url)
  end
end

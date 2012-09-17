class RemoteSubjectsController < ApplicationController
  def index
    raise ActiveRecord::NotFound if params[:q].blank?

    @remote_subject =
      RemoteSubject.find_or_create_using_webfinger_id(params[:q])
      
    respond_to do |format|
      format.html
    end
  end

  def show
    @remote_subject =
      RemoteSubject.find_by_slug!(params[:id])
  end
end

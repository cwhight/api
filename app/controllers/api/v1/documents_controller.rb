class Api::V1::DocumentsController < Api::V1::BaseController
  before_action :set_doc, only: [:show,  :latest, :update, :timestamp]

  def index
    @documents = Document.all
  end

  def show
    @document ? @revisions = @document.revisions.order(created_at: :desc) : render_error_not_found
  end

  def latest
    render_error_not_found unless @document
  end

  def update
    content = params[:content]
    if @document
      Revision.create(document: @document, content: @document.content, title: @document.title, created_at: @document.updated_at)
      @document.content = content
      render_error_did_not_save unless @document.save
    else
      render_error_not_found
    end
  end

  def timestamp
    timestamp = Time.parse(params[:timestamp]) + 1
    if @document
      if  @document.updated_at <= timestamp
        @document
      elsif @document.revisions.empty?
        @document.created_at <= timestamp ? @document : render_error_not_found
      else
        @revisions = @document.revisions.order(created_at: :desc)
        @revision = @revisions.select {|revision| revision.created_at <= timestamp }.first
        @revision ? @revision : render_error_not_found
      end
    else
      render_error_not_found
    end
  end

  private

  def set_doc
    title = params[:title]
    @document = Document.where(title: title).first
  end

  def render_error_not_found
    render json: {
      status: 404,
      error: :not_found,
      message: 'Document not found'
    }, status: 404
  end

  def render_error_did_not_save
    render json: {
      status: 400,
      error: :did_not_save,
      message: 'Update did not save'
    }, status: 404
  end
end

class Api::V1::DocumentsController < Api::V1::BaseController
  before_action :set_doc, only: [:show,  :latest, :update, :timestamp]

  def index
    @documents = Document.all
  end

  def show
    if @document
      @revisions = @document.revisions.order(created_at: :desc)
    else
      render_error_not_found
    end
  end

  def latest
    unless @document
      render_error_not_found
    end
  end

  def update
    content = params[:content]
    if @document
      Revision.create(document: @document, content: @document.content, title: @document.title)
      @document.content = content
      if @document.save

      else
        render_error_did_not_save
      end
    else
      render_error_not_found
    end
  end

  def timestamp
    timestamp = Time.parse(params[:timestamp])
    if @document
      if @document.revisions.empty?
        @document.created_at <= timestamp ? @document : render_error_not_found
      else
        @revisions = @document.revisions.order(created_at: :desc)
        @revision = @revisions.select {|revision| revision.created_at <= timestamp }.first
        if @revision
          @revision
        else
          render_error_not_found
        end
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

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
    @revisions = @document.revisions
    @revision = @revisions.select {|r| r.created_at <= timestamp }.first
  end

  private

  def set_doc
    title = params[:title]
    @document = Document.where(title: title).first
  end

  def render_error_not_found
    render json: {status: "not found", code: "404" }
  end

  def render_error_did_not_save
    render json: {status: "did not save", code: "400" }
  end
end

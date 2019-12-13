class Api::V1::DocumentsController < Api::V1::BaseController
  before_action :set_doc, only: [:show,  :latest ]

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

  private

  def set_doc
    title = params[:title]
    @document = Document.where(title: title).first
  end

  def render_error_not_found
    render json: {status: "not found", code: "404" }
  end

end

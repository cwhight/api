class Api::V1::DocumentsController < Api::V1::BaseController
  def index
    @documents = Document.all
  end
end

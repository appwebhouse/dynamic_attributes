class ApplicationForm
  include ActiveModel::Model
  include ActiveModelAttributes
  include ActiveModel::Validations::Callbacks
  include ActionView::Helpers::TranslationHelper

  def id
  end
end

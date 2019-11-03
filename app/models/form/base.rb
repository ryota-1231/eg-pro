class Form::Base
  include ActiveModel::Model
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  include ActiveModel::AttributeMethods
  include ActiveRecord::ConnectionAdapters
end
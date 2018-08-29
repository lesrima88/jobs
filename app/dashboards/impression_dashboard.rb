require "administrate/base_dashboard"

class ImpressionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    impressionable: Field::Polymorphic,
    id: Field::Number,
    user_id: Field::Number,
    controller_name: Field::String,
    action_name: Field::String,
    view_name: Field::String,
    request_hash: Field::String,
    ip_address: Field::String,
    session_hash: Field::String,
    message: Field::Text,
    referrer: Field::Text,
    params: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :impressionable,
    :id,
    :user_id,
    :controller_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :impressionable,
    :id,
    :user_id,
    :controller_name,
    :action_name,
    :view_name,
    :request_hash,
    :ip_address,
    :session_hash,
    :message,
    :referrer,
    :params,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :impressionable,
    :user_id,
    :controller_name,
    :action_name,
    :view_name,
    :request_hash,
    :ip_address,
    :session_hash,
    :message,
    :referrer,
    :params,
  ].freeze

  # Overwrite this method to customize how impressions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(impression)
  #   "Impression ##{impression.id}"
  # end
end

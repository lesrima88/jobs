require "administrate/base_dashboard"

class RequestDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    impressions: Field::HasMany,
    user: Field::BelongsTo,
    category: Field::BelongsTo,
    city: Field::BelongsTo,
    favorites: Field::HasMany,
    fans: Field::HasMany.with_options(class_name: "User"),
    comments: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    price: Field::Number,
    body: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    slug: Field::String,
    contact: Field::Number,
    price_id: Field::Number,
    budget: Field::String,
    image_file_name: Field::String,
    image_content_type: Field::String,
    image_file_size: Field::Number,
    image_updated_at: Field::DateTime,
    completed_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :impressions,
    :user,
    :category,
    :city,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :impressions,
    :user,
    :category,
    :city,
    :favorites,
    :fans,
    :comments,
    :id,
    :title,
    :price,
    :body,
    :created_at,
    :updated_at,
    :slug,
    :contact,
    :price_id,
    :budget,
    :image_file_name,
    :image_content_type,
    :image_file_size,
    :image_updated_at,
    :completed_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :impressions,
    :user,
    :category,
    :city,
    :favorites,
    :fans,
    :comments,
    :title,
    :price,
    :body,
    :slug,
    :contact,
    :price_id,
    :budget,
    :image_file_name,
    :image_content_type,
    :image_file_size,
    :image_updated_at,
    :completed_at,
  ].freeze

  # Overwrite this method to customize how requests are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(request)
  #   "Request ##{request.id}"
  # end
end

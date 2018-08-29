require "administrate/base_dashboard"

class JobDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    impressions: Field::HasMany,
    user: Field::BelongsTo,
    price: Field::BelongsTo,
    category: Field::BelongsTo,
    city: Field::BelongsTo,
    reviews: Field::HasMany,
    favorites: Field::HasMany,
    fans: Field::HasMany.with_options(class_name: "User"),
    comments: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    company: Field::String,
    url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    job_img_file_name: Field::String,
    job_img_content_type: Field::String,
    job_img_file_size: Field::Number,
    job_img_updated_at: Field::DateTime,
    add_user_id_to_jobs: Field::String,
    phone: Field::String,
    slug: Field::String,
    image_file_name: Field::String,
    image_content_type: Field::String,
    image_file_size: Field::Number,
    image_updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :impressions,
    :user,
    :price,
    :category,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :impressions,
    :user,
    :price,
    :category,
    :city,
    :reviews,
    :favorites,
    :fans,
    :comments,
    :id,
    :title,
    :description,
    :company,
    :url,
    :created_at,
    :updated_at,
    :job_img_file_name,
    :job_img_content_type,
    :job_img_file_size,
    :job_img_updated_at,
    :add_user_id_to_jobs,
    :phone,
    :slug,
    :image_file_name,
    :image_content_type,
    :image_file_size,
    :image_updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :impressions,
    :user,
    :price,
    :category,
    :city,
    :reviews,
    :favorites,
    :fans,
    :comments,
    :title,
    :description,
    :company,
    :url,
    :job_img_file_name,
    :job_img_content_type,
    :job_img_file_size,
    :job_img_updated_at,
    :add_user_id_to_jobs,
    :phone,
    :slug,
    :image_file_name,
    :image_content_type,
    :image_file_size,
    :image_updated_at,
  ].freeze

  # Overwrite this method to customize how jobs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(job)
  #   "Job ##{job.id}"
  # end
end

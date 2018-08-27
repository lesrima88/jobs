require "administrate/base_dashboard"

class JobDashboard < Administrate::BaseDashboard
  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

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
    description: Field::String,
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
  }

  # TABLE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to remove the limit or customize the returned array.
  TABLE_ATTRIBUTES = ATTRIBUTE_TYPES.keys.first(4)

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES
end

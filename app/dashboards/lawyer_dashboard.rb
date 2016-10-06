require "administrate/base_dashboard"

class LawyerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    category: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    image: Field::String,
    title: Field::String,
    email: Field::String,
    phone_number: Field::Number,
    professional_details: Field::Text,
    website: Field::String,
    twitter_link: Field::String,
    linkedin_link: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    token: Field::String,
    published: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :title,
    :email,
    :website,
    #:category,
    #:token,
    #:id,
    #:image,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :title,
    :email,
    :website,
    :twitter_link,
    :linkedin_link,
    :published,
    #:category,
    #:id,
    #:image,
    #:phone_number,
    #:professional_details,
    #:created_at,
    #:updated_at,
    #:token,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :category,
    :name,
    :image,
    :title,
    :email,
    :phone_number,
    :professional_details,
    :website,
    :twitter_link,
    :linkedin_link,
    #:token,
    :published,
  ].freeze

  # Overwrite this method to customize how lawyers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(lawyer)
  #   "Lawyer ##{lawyer.id}"
  # end
end

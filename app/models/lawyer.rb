class Lawyer < ActiveRecord::Base
  belongs_to :category

  #def to_param
   # "#{id}-#{token}"
  #end

  def to_param
    token
  end

  mount_uploader :image, ImageUploader

  validates :image,
            :name,
            :title,
            :category_id,
            :website,
            :email,
            presence: true
  validates :professional_details, length: { minimum: 300 }
  #validates :website, format: URI::regexp(%w(http https))

  validates_formatting_of :email, using: :email

  before_create :add_token
  before_save :format_lawyer_url



  def its_published?
    (!(self.published == false))
  end


  private

  def add_token
    self.token = SecureRandom.uuid
  end

  def format_lawyer_url
    unless website =~ URI::regexp(%w(http https))
      add_http_prefix
    end
  end

  def add_http_prefix
    if website
      self.website = "http://#{self.website}"
    end
  end


=begin
  def provide_name
    self.name = 'LawVille' if self.name == nil
  end

  def provide_permalink
    self.permalink = "#{ self.name } #{ SecureRandom.hex }".parameterize if self.permalink == nil
  end
=end

end

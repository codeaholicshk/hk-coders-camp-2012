class Account
  include Mongoid::Document
  attr_accessor :password, :password_confirmation

  # Fields
  field :name,             type: String
  field :surname,          type: String
  field :email,            type: String
  field :crypted_password, type: String
  field :role,             type: String
  field :uid,              type: String
  field :provider,         type: String
  field :bio,              type: String
  field :gravatar_id,      type: String
  field :blog_url,         type: String
  field :github_page,      type: String

  index(
    {uid: 1, provider: 1},
    {unique: true}
  )

  has_many :published_ideas, :class_name => "Idea", :inverse_of => :published_by_account

  # Validations
  validates_presence_of     :role
  validates_presence_of     :email,                      if: :email_required?
  validates_presence_of     :password,                   if: :password_required?
  validates_presence_of     :password_confirmation,      if: :password_required?
  validates_length_of       :password, within: 4..40, if: :password_required?
  validates_confirmation_of :password,                   if: :password_required?
  validates_length_of       :email,    within: 3..100, if: :email_required?
  validates_uniqueness_of   :email,    case_sensitive: false, if: :email_required?
  validates_format_of       :email,    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, if: :email_required?
  validates_format_of       :role,     with: /[A-Za-z]/

  # Callbacks
  before_save :encrypt_password, if: :password_required?

  ##
  # This method is for authentication purpose
  #
  def self.authenticate(email, password)
    account = where(email: email).first if email.present?
    account && account.has_password?(password) ? account : nil
  end

  ##
  # This method is used by AuthenticationHelper
  #
  def self.find_by_id(id)
    find(id) rescue nil
  end

  def has_password?(password)
    ::BCrypt::Password.new(crypted_password) == password
  end

  private
  def encrypt_password
    self.crypted_password = ::BCrypt::Password.create(self.password)
  end

  def password_required?
    !using_oauth? && (crypted_password.blank? || self.password.present?)
  end

  def email_required?
    !using_oauth?
  end

  def self.create_with_omniauth(auth)
    create! do |account|
      account.provider    = auth["provider"]
      account.uid         = auth["uid"]
      account.name        = auth["extra"]["raw_info"]["name"]
      account.blog_url    = auth["extra"]["raw_info"]["blog"]
      account.github_page = auth["extra"]["raw_info"]["html_url"]
      account.bio         = auth["extra"]["raw_info"]["bio"]
      account.gravatar_id = auth["extra"]["raw_info"]["gravatar_id"]
      account.role        = "users"
    end
  end

  private

  def using_oauth?
    provider.present?
  end
end

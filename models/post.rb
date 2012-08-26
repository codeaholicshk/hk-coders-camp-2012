class Post
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # field <name>, type: <type>, default: <value>
  field :title, type: String
  field :body, type: String

  validates_presence_of :title, :body
end

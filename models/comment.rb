class Comment
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # field <name>, type: <type>, default: <value>
  field :message, type: String
  belongs_to :commented_by_account, :class_name => "Account"
  
  embedded_in :idea
end

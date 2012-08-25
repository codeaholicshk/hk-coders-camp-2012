class Idea
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # field <name>, type: <type>, default: <value>
  field :name, type: String
  field :description, type: String
  field :cool_things, type: Array

  belongs_to :published_by_account, :class_name => "Account", inverse_of: :published_ideas
  embeds_many :comments

  # You can define indexes on documents using the index macro:
  # index :field <, unique: true>

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>
  
  validates_presence_of :name, :description
  validate :validate_cool_things

  def validate_cool_things
    filtered_array = self.cool_things.compact!
    errors.add(:cool_things, 'Cannot be blank') unless filtered_array.size == 3
  end

end

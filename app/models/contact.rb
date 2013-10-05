class Contact < ActiveRecord::Base
  belongs_to :group

  delegate :name, to: :group, prefix: true, allow_nil: true

  validates_presence_of :name, :email, :phone
end

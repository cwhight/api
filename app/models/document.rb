class Document < ApplicationRecord
  has_many :revisions
  validates :title, presence: true, uniqueness: true
end

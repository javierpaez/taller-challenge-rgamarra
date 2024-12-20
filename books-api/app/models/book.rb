class Book < ApplicationRecord
  STATUS_OPTIONS = %w(available checked_out reserved)

  validates_presence_of :title, :author, :publication_date
  validates_inclusion_of :rating, in: 0..5
  validates_inclusion_of :status, in: STATUS_OPTIONS, optional: true
end

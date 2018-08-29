class Account < ApplicationRecord
  has_many :account_accesses
  has_many :users, :through => :account_accesses
  before_validation :sanitize_name 
  validates_format_of :name, :with => /\A[-a-z0-9_]+\Z/
  validates :name, presence: true, uniqueness: true

 

  private

    def sanitize_name
      name = name.to_s.strip.downcase
    end
end

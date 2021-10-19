class User < ActiveRecord::Base
  include ActiveModel::SecurePassword
  has_secure_password
  validates_confirmation_of :password
  validates :name, uniqueness: true, length: { in: 4..16 }
  validates :password, confirmation: true, length: { in: 8..16 }
  validate :complex_check

  has_many :tasks

  def complex_check
    errors.add(:password, 'should be contains at least 1 upper case, 1 lower case, 1 number') unless password =~ /[a-z]/ && password =~ /[A-Z]/ && password =~ /[0-9]/
    errors.add(:name, 'should not contains any special characters') if name =~ /[~|!|@|#|$|%|^|&|*|<|>|?]/
  end
end

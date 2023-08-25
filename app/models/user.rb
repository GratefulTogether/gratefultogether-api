class User < ApplicationRecord
  has_many :wins, dependent: :destroy
  validates_presence_of :name
end

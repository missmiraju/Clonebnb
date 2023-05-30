class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_tags
  has_many :tags, through: :user_tags

  # TODO: add validators
  # TODO: add new fields (first_name last_name username desctription profile_picture_url age:date gender)
  # to strong params in User controller (which might be called something else because of devise)
end

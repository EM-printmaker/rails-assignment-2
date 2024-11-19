class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  #has_many :rooms, dependent:destroy
  #has_many :reservations, dependent:destroy

  validate :verify_file_type

  private

  def verify_file_type
    return unless avatar.attached?

    allowed_file_types = %w[image/jpg image/jpeg image/gif image/png]
    errors.add(:avatar, '有効なフォーマットではありません') unless allowed_file_types.include?(avatar.blob.content_type)
  end
end

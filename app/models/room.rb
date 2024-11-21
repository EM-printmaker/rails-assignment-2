class Room < ApplicationRecord
  has_one_attached :room_image
  belongs_to :user
  #has_many :hotel_bills
  #has_many :reservations, through: :hotel_bills
  has_many :reservations

  before_create :get_room_image

  def image_resize(width, height)
    return unless room_image.content_type.in?(%w[image/jpeg image/png])
    room_image.variant(resize_to_fill: [width, height]).processed
  end

  private

  def get_room_image
    if !self.room_image.attached?
      file_path = Rails.root.join('app/javascript/images/default-image.png')
      self.room_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
  end



end

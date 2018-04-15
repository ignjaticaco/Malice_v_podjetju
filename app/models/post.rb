class Post < ActiveRecord::Base
acts_as_votable
has_attached_file :avatar
has_many :comments, dependent: :destroy
belongs_to :admin
validates :title, presence: true,
                    length: {minimum: 5}
validates_format_of :date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "must be in the following format: dd/mm/yyyy"

has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end

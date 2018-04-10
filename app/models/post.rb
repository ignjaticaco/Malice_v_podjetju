class Post < ActiveRecord::Base
acts_as_votable
has_many :comments, dependent: :destroy
belongs_to :admin
validates :title, presence: true,
                    length: {minimum: 5}
validates_format_of :date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "must be in the following format: dd/mm/yyyy"
end

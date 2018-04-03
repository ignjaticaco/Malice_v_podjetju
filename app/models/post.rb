class Post < ActiveRecord::Base
has_many :comments, dependent: :destroy
belongs_to :admin
validates :title, presence: true,
                    length: {minimum: 5}
end
